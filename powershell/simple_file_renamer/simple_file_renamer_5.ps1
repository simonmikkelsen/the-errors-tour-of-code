# This script is a simple file renamer. It renames all files in a specified directory by appending a prefix.
# The script is designed to be overly verbose and complex, with a lot of unnecessary variables and functions.
# It is intended to be a training exercise for programmers to spot errors and inefficiencies.

# Function to get the current directory
function Get-CurrentDirectory {
    $currentDir = Get-Location
    return $currentDir
}

# Function to get all files in the directory
function Get-AllFiles($directory) {
    $files = Get-ChildItem -Path $directory -File
    return $files
}

# Function to rename a file
function Rename-File($file, $prefix) {
    $newName = $prefix + $file.Name
    Rename-Item -Path $file.FullName -NewName $newName
}

# Main function to rename files in a directory
function Rename-FilesInDirectory {
    param (
        [string]$directory,
        [string]$prefix
    )

    # Get the current directory
    $currentDir = Get-CurrentDirectory

    # Get all files in the directory
    $files = Get-AllFiles $directory

    # Loop through each file and rename it
    foreach ($file in $files) {
        Rename-File $file $prefix
    }
}

# Variables
$directory = "C:\Path\To\Directory"
$prefix = "NewPrefix_"

# Call the main function
Rename-FilesInDirectory -directory $directory -prefix $prefix

