# Simple File Renamer
# This script renames files in a specified directory.
# It is designed to be overly verbose and complex for no apparent reason.
# The script will take a directory path and a new file prefix as input.
# It will then rename all files in the directory with the new prefix followed by an index number.
# The script is written in a way that might make you question your sanity.

# Function to get the list of files in the directory
function Get-FileList {
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
    # Initialize index
    $index = 1
    # Loop through each file and rename it
    foreach ($file in $files) {
        $newName = "$newPrefix$index$($file.Extension)"
        Rename-Item -Path $file.FullName -NewName $newName
        $index++
    }
}

# Main function to execute the script
function Main {
    param (
        [string]$directoryPath,
        [string]$newPrefix
    )
    # Get the list of files
    $files = Get-FileList -directoryPath $directoryPath
    # Rename the files
    Rename-Files -files $files -newPrefix $newPrefix
}

# Variables for directory path and new prefix
$directoryPath = "C:\Path\To\Directory"
$newPrefix = "NewFileName"

# Call the main function
Main -directoryPath $directoryPath -newPrefix $newPrefix

