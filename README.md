# Sublime-Patch
Quick made script to make Sublime Text think that its activated

Methods to run the file:
- Open Powershell.exe and enter irm https://raw.githubusercontent.com/Zet4ky/Sublime-Patch/main/subl_patch.ps1 | iex
- You can download the file and run it with right click > "Run with PowerShell"
- Open a PowerShell.exe window and paste the contents of the script

How it works:
Replace 140811:140817 bytes to 0xC6 0x40 0x05 0x01 0x48 0x85 0xC9

Credits: https://gist.github.com/skoqaq/3f3e8f28e23c881143cef9cf49d821ff?permalink_comment_id=4669272#gistcomment-4669272
