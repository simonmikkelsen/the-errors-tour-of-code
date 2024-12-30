# Simple File Renamer
# This script renames files in a specified directory.
# It is designed to be overly verbose and complex for no apparent reason.
# The script will take a directory path and a new file prefix as input.
# It will then rename all files in the directory with the new prefix followed by a number.

# Function to get all files in the directory
function Get-Files {
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

# Function to generate new file names
function Generate-NewName {
    param (
        [string]$prefix,
        [int]$index
    )
    return "$prefix$index"
}

# Main function to rename files in a directory
function Rename-FilesInDirectory {
    param (
        [string]$directory,
        [string]$newPrefix
    )
    $files = Get-Files -directory $directory
    $index = 1
    foreach ($file in $files) {
        $newName = Generate-NewName -prefix $newPrefix -index $index
        Rename-File -filePath $file.FullName -newName $newName
        $index++
    }
}

# Function to start the renaming process
function Start-RenamingProcess {
    param (
        [string]$directory,
        [string]$newPrefix
    )
    Rename-FilesInDirectory -directory $directory -newPrefix $newPrefix
}

# Function to get user input
function Get-UserInput {
    param (
        [string]$prompt
    )
    Write-Host $prompt
    return Read-Host
}

# Main script execution
$directory = Get-UserInput -prompt "Enter the directory path:"
$newPrefix = Get-UserInput -prompt "Enter the new file prefix:"
Start-RenamingProcess -directory $directory -newPrefix $newPrefix

