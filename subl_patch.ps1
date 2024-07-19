<#
 * Credits: https://gist.github.com/skoqaq/3f3e8f28e23c881143cef9cf49d821ff?permalink_comment_id=4669272#gistcomment-4669272
#>

$basePath = "C:\Program Files\Sublime Text"
$filePath = Join-Path $basePath "sublime_text.exe"

function Restart-Script {
    [String]$cmd = "@echo off & chcp 850 >nul && REG add `"HKCU\Console`" /v QuickEdit /t REG_DWORD /d 0 /f >nul 2>&1 && cls && powershell.exe -Executionpolicy Unrestricted -File `"$PSCommandPath`" `"$ScriptArgs`""
    Write-Host "Script is restarting, wait..."
    Start-Process -FilePath "conhost.exe" -ArgumentList "cmd.exe /c $cmd" -Verb runAs
    Exit 1
}

$isAdmin = [bool]([Security.Principal.WindowsIdentity]::GetCurrent().Groups -match 'S-1-5-32-544')
if (-not $isAdmin) {
    #Read-Host -Prompt "Script needs to run as admin, Press any key to continue."
    Invoke-Expression Restart-Script
}

while (Get-Process -Name "sublime_text" -ErrorAction SilentlyContinue) {
    Write-Host "Sublime Text is currently running."
    $terminate = Read-Host "Please close Sublime Text and press Enter to continue."
    Clear-Host
}

if (-Not (Test-Path $filePath)) {
    Write-Host "Sublime Text executable not found at $filePath."
    
    $basePath = Read-Host "Please enter the base path of Sublime Text (i.e: D:\Programs\sublime)"
    $filePath = Join-Path $basePath "sublime_text.exe"

    if (-Not (Test-Path $filePath)) {
        Write-Host "Sublime Text executable not found at $filePath. Exiting script."
        Pause
        exit
    }
}

$sublimeVersionOutput = & (Join-Path $basePath "subl.exe") -v

if ($sublimeVersionOutput -like "*4169*") {
    $bytes = [System.IO.File]::ReadAllBytes($filePath)
    
    $bytes[140811] = 0xC6
    $bytes[140812] = 0x40
    $bytes[140813] = 0x05
    $bytes[140814] = 0x01
    $bytes[140815] = 0x48
    $bytes[140816] = 0x85
    $bytes[140817] = 0xC9
    
    [System.IO.File]::WriteAllBytes($filePath, $bytes)
    
    Read-Host "Sublime Text patched Successfully. Press any key to exit"
} else {
    Read-Host "Incompatible Sublime version installed. Press any key to exit"
}
