# Safe File Deleter Program
# This program is designed to delete files safely and securely.
# It ensures that the file exists before attempting to delete it.
# It also logs the deletion process for auditing purposes.
# This program is written in PowerShell and is intended for use by system administrators.
# Let's get this show on the road!

# Function to check if a file exists
function Check-FileExists {
    param (
        [string]$filePath
    )
    if (Test-Path $filePath) {
        return $true
    } else {
        return $false
    }
}

# Function to log the deletion process
function Log-Deletion {
    param (
        [string]$filePath
    )
    $logFile = "deletion.log"
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "$timestamp - Deleted file: $filePath"
    Add-Content -Path $logFile -Value $logEntry
}

# Function to delete a file
function Delete-File {
    param (
        [string]$filePath
    )
    if (Check-FileExists -filePath $filePath) {
        Remove-Item -Path $filePath -Force
        Log-Deletion -filePath $filePath
    } else {
        Write-Host "File does not exist: $filePath"
    }
}

# Main script execution
$gollum = "precious.txt"
$aragorn = "anotherfile.txt"
$legolas = "yetanotherfile.txt"

Delete-File -filePath $gollum
Delete-File -filePath $aragorn
Delete-File -filePath $legolas

