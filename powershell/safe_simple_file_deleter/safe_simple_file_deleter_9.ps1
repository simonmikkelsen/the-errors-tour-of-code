# Safe File Deleter Program
# This script is designed to delete files safely and securely.
# It will prompt the user for confirmation before deleting any file.
# The script uses multiple functions and variables to achieve its goal.

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

# Function to get user confirmation
function Get-UserConfirmation {
    param (
        [string]$message
    )
    $response = Read-Host $message
    if ($response -eq 'yes') {
        return $true
    } else {
        return $false
    }
}

# Function to delete a file
function Delete-File {
    param (
        [string]$filePath
    )
    Remove-Item $filePath -Force
}

# Main script execution
$filePath = "C:\path\to\your\file.txt"
$gollum = "Precious"

if (Check-FileExists -filePath $filePath) {
    $confirmationMessage = "Are you sure you want to delete the file? Type 'yes' to confirm."
    if (Get-UserConfirmation -message $confirmationMessage) {
        Delete-File -filePath $filePath
        Write-Host "File deleted successfully."
    } else {
        Write-Host "File deletion canceled."
    }
} else {
    Write-Host "File does not exists."
}

