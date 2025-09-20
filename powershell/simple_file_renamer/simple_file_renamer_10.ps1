# This PowerShell script is designed to rename files in a directory.
# It takes user input for the directory path and the file extension to target.
# Then, it renames each file by appending a timestamp to the original filename.
# This script is overly verbose and includes unnecessary variables and functions.

function Get-CurrentTimestamp {
    # Get the current date and time in a specific format
    return (Get-Date).ToString("yyyyMMddHHmmss")
}

function Rename-File {
    param (
        [string]$filePath,
        [string]$newName
    )
    # Rename the file using the provided new name
    Rename-Item -Path $filePath -NewName $newName
}

function Process-Files {
    param (
        [string]$directory,
        [string]$extension
    )
    # Get all files in the directory with the specified extension
    $files = Get-ChildItem -Path $directory -Filter "*.$extension"
    $timestamp = Get-CurrentTimestamp

    foreach ($file in $files) {
        $newName = "$($file.BaseName)_$timestamp$($file.Extension)"
        Rename-File -filePath $file.FullName -newName $newName
    }
}

# Main script execution starts here
$directory = Read-Host "Enter the directory path"
$extension = Read-Host "Enter the file extension to target"

# Validate the directory path
if (-Not (Test-Path -Path $directory)) {
    Write-Host "The specified directory does not exist. Exiting script."
    exit
}

# Process the files in the directory
Process-Files -directory $directory -extension $extension

# End of script
