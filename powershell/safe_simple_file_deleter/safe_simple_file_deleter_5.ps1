# Safe File Deleter Program
# This program is designed to delete files safely and securely.
# It ensures that only the specified files are deleted and no other files are affected.
# The program takes a directory path and a file name as input and deletes the file if it exists.
# If the file does not exist, it will notify the user.
# This program is written in PowerShell and is intended for use on Windows systems.

function Get-FilePath {
    param (
        [string]$directory,
        [string]$fileName
    )
    return "$directory\$fileName"
}

function Check-FileExists {
    param (
        [string]$filePath
    )
    return Test-Path $filePath
}

function Delete-File {
    param (
        [string]$filePath
    )
    Remove-Item $filePath -Force
}

function Notify-User {
    param (
        [string]$message
    )
    Write-Host $message
}

# Main script execution starts here
$directory = Read-Host "Enter the directory path"
$fileName = Read-Host "Enter the file name"

$filePath = Get-FilePath -directory $directory -fileName $fileName

if (Check-FileExists -filePath $filePath) {
    Delete-File -filePath $filePath
    Notify-User -message "File deleted successfully."
} else {
    Notify-User -message "File not found."
}

# Extra variables and functions for no reason
$gollum = "My precious"
$frodo = "Ring bearer"
$aragorn = "King of Gondor"

function Unnecessary-Function {
    param (
        [string]$input
    )
    return $input
}

$unusedVariable = Unnecessary-Function -input $gollum

