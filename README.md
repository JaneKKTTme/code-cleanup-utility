# 🧹 Code Cleanup Utility
A VBScript utility that recursively deletes code files and empty folders. Perfect for when you want to play Jenga with your file system! 🎯

> *Warning:* With great power comes great responsibility... and potentially great regret. ⚠️

## 📑 Table of Contents
- [Description](#description)
- [Features](#features)
- [Supported File Types](#supported-file-types)
- [Safety Features](#safety-features)
- [Work algorithm](#how-it-works)
- [Usage](#how-to-use)
- [Configuration](#configuration)
- [Warning Label](#warning-label)
- [Help, I Deleted Everything!](#help-i-deleted-everything)
- [Possible Improvements](#possible-improvements)
- [Feature Ideas](#feature-ideas)
- [License](#license)
- [Disclaimer](#disclaimer)
- [Pro Tip](#pro-tip)

## 📋 Description
This VBScript is designed to clean your file system from code files that keep multiplying when you're not looking! 🤖

## ✨ Features
- **Recursive file deletion** because who has time to delete things one by one?
- **Safety checks** so you don't accidentally delete your thesis... again
- **Recycle bin option** for those *"oh crap"* moments
- **File type targeting** because only your code know what you did last summer
- **Empty folder cleanup** because empty folders are just sad and unused

### 🎯 Supported File Types
The script hunts down these extensions like a determined cat chasing a laser pointer:
- `.cpp`, `.c`, `.cxx` - C/C++ files
- `.h`, `.hpp` - headers
- `.java` - Java files
- `.py` - Python files
- `.cs` - C# files
- `.pas`, `.inc` - Pascal files (because why not?)

### 🛡️ Safety Features
- *Confirmation dialog* - Your last chance to chicken out
- *Recycle bin mode* - The "undo" button you'll probably need
- *Attribute checks* - Skips read-only and system files (usually)
- *Folder existence verification* - So it doesn't delete your hopes and dreams

## 🎪 How It Works
- Finds your `Users` folder (where all your secrets live)
- Asks *"Are you sure?"*
- Goes on a recursive deleting spree
- Shows you a count of your life choices

## 🚀 How to Use
1. Pray to the tech gods
2. Save the .vbs file on your desktop
3. **Double-check your backups. Seriously.**
4. Run it:
```cmd
wscript delete_all_code.vbs
```
Or just double-click and hope for the best! 🎲

## ⚙️ Configuration
In the Main() function, you can choose your level of bravery:
```vbscript
copied = True  ' 🟢 Safe mode (goes to recycle bin)
copied = False ' 🔥 YOLO mode (permanent deletion)
```

## 💀 Warning Label
**THIS SCRIPT COMES WITH NO WARRANTY EXCEPT THE WARRANTY THAT YOU'LL PROBABLY REGRET USING IT**

Before running:
- ✅ Backup your data (no, seriously)
- ✅ Test on a dummy folder (strongly **RECOMMENDED**)
- ✅ Say goodbye to your files
- ✅ Consider therapy

## 🆘 Help, I Deleted Everything!
**First:** Panic! 🚨

**Then:**
- Check the Recycle Bin (if you used safe mode)
- Restore from backup (you did backup, right?)
- Cry softly (we've all been there)
- Learn a valuable lesson about running scripts from the Internet

## 🛠️ Possible Improvements
- Graphical User Interface (GUI): Because typing is hard, and buttons are pretty.
- Undo Functionality: For those who panic after clicking "Yes".
- Dry-Run Mode: See what would be deleted without actually deleting anything (the ultimate coward mode!).
- Custom File Extensions: Let users add their own nemesis file types to the hitlist.
- Log File Generation: Get a detailed report of what was deleted, for post-apocalyptic analysis.
- Better Error Handling: Make the script slightly less dramatic when it encounters a problem.

### 🔮 Nearest Plans
Even the most dangerous tools can be sharpened! Here are some ideas for future versions:

🎯 **The "Where to Wreak Havoc?" Module**
- Let users choose the battlefield: add a proper dialog to select which folder to nuke, instead of automatically targeting the `Users` directory. Because sometimes you want to delete code, and sometimes you just have a vendetta against a specific folder.

♻️ **The "Oops-proof Recycle Bin" Enhancer**
- Make binning stuff bulletproof: improve the stability of moving files to the Recycle Bin across different devices and Windows versions. The goal is to make the "undo" option actually work, not just tease you before it crashes and burns.

🔪 **The "Permanent Annihilation" Toggle**
- A switch for the brave (or foolish): add a clear user option to choose between "sending to the Recycle Bin" (for mortals) and "permanent deletion" (for those who like to live on the edge with no safety net).

## 📜 License
WTFPL (Want to Forget This Probably Landed me or someone in trouble) License

This script is provided *"as is"* - which is lawyer-speak for *"you're on your own, buddy!"*

## 🎭 Disclaimer
The author takes **no** responsibility for:
- Lost code, hopes and dreams
- Broken projects
- Divorce papers (why were they in code files?)
- Existential crises caused by file deletion
- The sudden urge to become a farmer after running this

## 💡 Pro Tip
If the script asks "Are you sure?" and you hesitate for more than 3 seconds, maybe don't click "Yes". Just maybe. 🤔

> Remember: rm -rf / is for Linux beginners. This is for Windows professionals who like to live dangerously! 😎

***Happy (and careful) cleaning!*** 🧹✨