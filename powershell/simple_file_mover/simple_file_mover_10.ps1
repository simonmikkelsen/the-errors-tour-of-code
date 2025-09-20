# This program is designed to move files from one directory to another.
# It takes user input for the source and destination directories.
# The program will then move the specified file to the new location.
# This is a simple file mover script written in PowerShell.

# Function to get user input
function Get-UserInput {
    param (
        [string]$prompt
    )
    Write-Host $prompt
    return Read-Host
}

# Function to check if a file exists
function Check-FileExists {
    param (
        [string]$filePath
    )
    if (Test-Path $filePath) {
        return $true
    } else {
        return $false
    }
}

# Function to move the file
function Move-File {
    param (
        [string]$source,
        [string]$destination
    )
    Move-Item -Path $source -Destination $destination
}

# Main script execution starts here
$sourceDir = Get-UserInput -prompt "Enter the source directory:"
$destinationDir = Get-UserInput -prompt "Enter the destination directory:"
$fileName = Get-UserInput -prompt "Enter the file name to move:"

$sourcePath = "$sourceDir\$fileName"
$destinationPath = "$destinationDir\$fileName"

if (Check-FileExists -filePath $sourcePath) {
    Move-File -source $sourcePath -destination $destinationPath
    Write-Host "File moved successfully."
} else {
    Write-Host "File does not exist."
}

