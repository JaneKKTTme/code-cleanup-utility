' Recursively delete code files and empty folders with safety checks
Function DeleteCodeAndEmptyFolders(currentFolder, copied)
	Dim fso, so, folder, subFolder, deletedCount, subDeletedCount, fileTypes, file, pos, ft

	Set fso = CreateObject("Scripting.FileSystemObject")

	' Initialize shell application only if needed
	If copied Then
		Set so = CreateObject("Shell.Application")
	End If

	' Check existence of folder
	If not fso.FolderExists(currentfolder) Then
		DeleteCodeAndEmptyFolders = 0
		Exit Function
	End If

	Set folder = fso.GetFolder(currentFolder)
	deletedCount = 0

	' Process subfolders
	For Each subFolder In Folder.SubFolders
		subDeletedCount =  DeleteCodeAndEmptyFolders(subFolder.Path, copied)
		deletedCount = deletedCount + subDeletedCount
	Next

	' Skip read-only and system folders
	If (folder.Attributes and 1) Or (folder.Attributes and 4) Then
		DeleteCodeAndEmptyFolders = deletedCount
		Exit Function
	End If

	' Define target file extensions
	fileTypes = Array("cpp", "c", "cxx", "h", "hpp", "java", "py", "cs", "pas", "inc")
	
	' Delete code files
	For Each file In folder.Files
		pos = InStrRev(file.Name, ".")
		If pos > 0 Then
			cf = LCase(Mid(file.Name, pos + 1))

			' Check if extension is in target list
			Dim found
			found = False
			For Each ft in fileTypes
				If cf = ft Then
					found = True
					Exit For
				End If
			Next

			If found Then
				On Error Resume Next
				' Move file to recycle bin if enabled
				' Else permanent delete
				If copied Then
					so.Namespace(&HA&).MoveHere file.Path
				Else
					fso.DeleteFile file.Path, True
				End If
				deletedCount = deletedCount + 1
				On Error Goto 0
			End If
		End If
	Next
	
	' Delete empty folder
	If folder.Files.Count = 0 And folder.SubFolders.Count = 0 Then
		On Error Resume Next
		If copied Then
			so.Namespace(&HA&).MoveHere folder.Path
		Else
			fso.DeleteFolder folder.Path
		End If
		On Error Goto 0
	End If

	DeleteCodeAndEmptyFolders = deletedCount
End Function

Function EnableAccessVBA()
	On Error Resume Next
	Key = "HKEY_CURRENT_USER\Software\Microsoft\Office\" & Application.Version & "\Excel\Security\AccessVBOM"
	CreateObject("WScript.Shell").RegWrite Key, 1, "REG_DWORD"
End Function

Function DisableAccessVBA()
	On Error Resume Next
	Key = "HKEY_CURRENT_USER\Software\Microsoft\Office\" & Application.Version & "\Excel\Security\AccessVBOM"
	CreateObject("WScript.Shell").RegWrite Key, 0, "REG_DWORD"
End Function

Sub Main()
	Dim fso, initFolder, deletedCount, resp, copied

	Set fso = CreateObject("Scripting.FileSystemObject")
	deletedCount = 0
	
	' Choose users space regardless of device
	initFolder = "."
	While fso.getFolder(initFolder).Name <> "Users"
		initFolder = "..\" & initFolder
	Wend
	initFolder = fso.getFolder(initFolder).Path

	' Take copy to recycle bin (if you want but it is more safety)
	' Copy - true, not copy - false
	copied = True 

	' Notify safety
	resp = MsgBox("This will delete code files from: " & initFolder & vbCrLf & _
                     "Are you sure you want to continue?", _
                     vbYesNo + vbExclamation, "Warning: File Deletion")

	If resp = vbYes Then
		 If fso.FolderExists(initFolder) Then
		 	Call EnableAccessVBA
            deletedCount = DeleteCodeAndEmptyFolders(initFolder, copied)
            MsgBox "Operation completed. Deleted " & deletedCount & " files.", vbInformation
            Call DisableAccessVBA
        Else
            MsgBox "Target folder does not exist: " & initFolder, vbExclamation
        End If
    Else
        MsgBox "Operation cancelled.", vbInformation
    End If
End Sub

' Entry point with error handling
On Error Resume Next
Call Main()