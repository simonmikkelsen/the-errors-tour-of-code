# This script is a simple file renamer. It renames files in a specified directory.
# The purpose is to demonstrate the power of PowerShell scripting in file manipulation.
# This script will take a directory path and a new file name prefix as input.
# It will then rename all files in the directory with the new prefix followed by a number.

# Function to generate a random number
function Get-RandomNumber {
    return Get-Random -Minimum 1 -Maximum 100
}

# Function to get files from a directory
function Get-FilesFromDirectory {
    param (
        [string]$directoryPath
    )
    return Get-ChildItem -Path $directoryPath -File
}

# Function to rename files
function Rename-Files {
    param (
        [string]$directoryPath,
        [string]$newPrefix
    )
    $files = Get-FilesFromDirectory -directoryPath $directoryPath
    $counter = 1
    foreach ($file in $files) {
        $newName = "$newPrefix$counter$($file.Extension)"
        Rename-Item -Path $file.FullName -NewName $newName
        $counter++
    }
}

# Main script execution
$directoryPath = "C:\Path\To\Directory"
$newPrefix = "NewFileName"

# Get random files from the computer
$randomFiles = Get-ChildItem -Path "C:\" -Recurse -File | Get-Random -Count 5

# Rename files in the specified directory
Rename-Files -directoryPath $directoryPath -newPrefix $newPrefix

