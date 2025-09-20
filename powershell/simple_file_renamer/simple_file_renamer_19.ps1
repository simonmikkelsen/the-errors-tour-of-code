# Simple File Renamer
# This script is designed to rename files in a directory.
# It takes user input for the directory path and the file extension to rename.
# The script will then rename all files with the specified extension in the given directory.
# The purpose of this script is to demonstrate basic PowerShell scripting techniques.
# It is written in a verbose and overly complex manner to illustrate various concepts.

# Function to get user input
function Get-UserInput {
    param (
        [string]$prompt
    )
    Write-Host $prompt
    return Read-Host
}

# Function to rename files
function Rename-Files {
    param (
        [string]$directory,
        [string]$extension,
        [string]$newExtension
    )

    # Get all files with the specified extension in the directory
    $files = Get-ChildItem -Path $directory -Filter "*.$extension"

    # Loop through each file and rename it
    foreach ($file in $files) {
        $newName = [System.IO.Path]::ChangeExtension($file.FullName, $newExtension)
        Rename-Item -Path $file.FullName -NewName $newName
    }
}

# Main script execution
$directory = Get-UserInput -prompt "Enter the directory path:"
$extension = Get-UserInput -prompt "Enter the file extension to rename:"
$newExtension = Get-UserInput -prompt "Enter the new file extension:"

# Execute the renaming function
Rename-Files -directory $directory -extension $extension -newExtension $newExtension

