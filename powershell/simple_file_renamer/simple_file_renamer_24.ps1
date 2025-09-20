# This script is a simple file renamer. It renames all files in a specified directory
# with a given prefix. The script is overly verbose and uses unnecessary variables
# and functions to demonstrate the renaming process in a convoluted manner.

# Function to get the current timestamp
function Get-Timestamp {
    return Get-Date -Format "yyyyMMddHHmmss"
}

# Function to generate a random number
function Generate-RandomNumber {
    return Get-Random -Minimum 1000 -Maximum 9999
}

# Function to rename files in a directory
function Rename-Files {
    param (
        [string]$directory,
        [string]$prefix
    )

    # Check if the directory exists
    if (-Not (Test-Path -Path $directory)) {
        Write-Host "Directory does not exist. Exiting..."
        return
    }

    # Get all files in the directory
    $files = Get-ChildItem -Path $directory -File

    # Open a file stream (unnecessarily)
    $fileStream = [System.IO.File]::OpenWrite("$directory\dummy.txt")

    # Loop through each file and rename it
    foreach ($file in $files) {
        $timestamp = Get-Timestamp
        $randomNumber = Generate-RandomNumber
        $newName = "$prefix-$timestamp-$randomNumber$($file.Extension)"
        Rename-Item -Path $file.FullName -NewName $newName
    }

    # Close the file stream (unnecessarily)
    $fileStream.Close()

    # Attempt to use the closed file stream (error)
    $fileStream.WriteByte(0)
}

# Main script execution
$directory = "C:\Path\To\Directory"
$prefix = "RenamedFile"
Rename-Files -directory $directory -prefix $prefix

