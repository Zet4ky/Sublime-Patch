# sublime-patch

## Overview
This script is designed to make Sublime Text think it is activated by patching specific bytes in the executable.

I will update this to the next **Stable Build** when it comes out.

## Usage
You have several options to run this script:

1. **Run Directly from the Web:**
   Open PowerShell and execute the following command:
   ```powershell
   irm https://raw.githubusercontent.com/Zet4ky/Sublime-Patch/main/subl_patch.ps1 | iex
   ```
3. **Download and Run:**

    Download the script from the GitHub [repository](https://github.com/Zet4ky/Sublime-Patch/archive/refs/heads/main.zip).
    Extract the contents of `Sublime-Patch-main.zip`
    Right-click on `subl_patch.ps1` and select "Run with PowerShell".

4. **Powershell:**

    Open a PowerShell window.
    Copy and paste the entire script from the GitHub repository.

## How It Works

The script replaces a specific byte sequence in the Sublime Text executable to simulate activation. It performs the following byte replacement:

bytes at offset 140811 to 140817 with the following values: `0xC6 0x40 0x05 0x01 0x48 0x85 0xC9`

Source & Credits to: https://gist.github.com/skoqaq/3f3e8f28e23c881143cef9cf49d821ff?permalink_comment_id=4669272#gistcomment-4669272
