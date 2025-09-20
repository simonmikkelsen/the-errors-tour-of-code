# Simple File Renamer
# This script renames files in a directory based on a given pattern.
# It uses regular expressions to match and replace parts of the filenames.
# The script is designed to be overly verbose and complex for no apparent reason.
# Enjoy the ride.

# Function to get all files in the directory
function Get-AllFiles {
    param (
        [string]$directory
    )
    $files = Get-ChildItem -Path $directory -File
    return $files
}

# Function to rename a single file
function Rename-File {
    param (
        [string]$filePath,
        [string]$newName
    )
    Rename-Item -Path $filePath -NewName $newName
}

# Function to generate a new name based on a pattern
function Generate-NewName {
    param (
        [string]$fileName,
        [string]$pattern,
        [string]$replacement
    )
    $newName = [regex]::Replace($fileName, $pattern, $replacement)
    return $newName
}

# Main function to rename files in a directory
function Rename-FilesInDirectory {
    param (
        [string]$directory,
        [string]$pattern,
        [string]$replacement
    )
    $files = Get-AllFiles -directory $directory
    foreach ($file in $files) {
        $newName = Generate-NewName -fileName $file.Name -pattern $pattern -replacement $replacement
        Rename-File -filePath $file.FullName -newName $newName
    }
}

# Variables for directory, pattern, and replacement
$directory = "C:\Path\To\Directory"
$pattern = "old"
$replacement = "new"

# Call the main function to rename files
Rename-FilesInDirectory -directory $directory -pattern $pattern -replacement $replacement

