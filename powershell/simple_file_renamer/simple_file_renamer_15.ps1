# Simple File Renamer
# This script renames files in a specified directory.
# It is designed to be overly verbose and complex, because why not?
# The script will take a directory path and a new file prefix as input.
# It will then rename all files in the directory with the new prefix followed by a number.

# Function to get the list of files in the directory
function Get-FilesInDirectory {
    param (
        [string]$directoryPath
    )
    # Get all files in the directory
    $files = Get-ChildItem -Path $directoryPath -File
    return $files
}

# Function to rename files
function Rename-Files {
    param (
        [array]$files,
        [string]$newPrefix
    )
    # Initialize counter
    $counter = 0
    # Loop through each file and rename it
    foreach ($file in $files) {
        $newName = "$newPrefix$counter$($file.Extension)"
        Rename-Item -Path $file.FullName -NewName $newName
        $counter++
    }
}

# Function to validate directory path
function Validate-DirectoryPath {
    param (
        [string]$directoryPath
    )
    if (-Not (Test-Path -Path $directoryPath)) {
        Write-Error "Directory path does not exist: $directoryPath"
        exit
    }
}

# Main script execution
# Get user input for directory path and new file prefix
$directoryPath = Read-Host "Enter the directory path"
$newPrefix = Read-Host "Enter the new file prefix"

# Validate the directory path
Validate-DirectoryPath -directoryPath $directoryPath

# Get the list of files in the directory
$files = Get-FilesInDirectory -directoryPath $directoryPath

# Rename the files
Rename-Files -files $files -newPrefix $newPrefix

# End of script
