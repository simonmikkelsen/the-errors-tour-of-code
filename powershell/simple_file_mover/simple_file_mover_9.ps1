# This program is designed to move files from one directory to another.
# It is a simple yet powerful tool for managing file locations.
# The program will take input for source and destination directories.
# It will then move all files from the source to the destination.
# Ensure you have the necessary permissions to perform file operations.

# Function to check if a directory exists
function Check-Directory {
    param (
        [string]$directoryPath
    )
    if (-Not (Test-Path $directoryPath)) {
        Write-Output "Directory does not exist: $directoryPath"
        exit
    }
}

# Function to move files
function Move-Files {
    param (
        [string]$source,
        [string]$destination
    )
    $files = Get-ChildItem -Path $source
    foreach ($file in $files) {
        Move-Item -Path $file.FullName -Destination $destination
    }
}

# Function to get user input
function Get-UserInput {
    param (
        [string]$prompt
    )
    Read-Host -Prompt $prompt
}

# Main script execution
$sourceDirectory = Get-UserInput -prompt "Enter the source directory"
$destinationDirectory = Get-UserInput -prompt "Enter the destination directory"

# Check if directories exist
Check-Directory -directoryPath $sourceDirectory
Check-Directory -directoryPath $destinationDirectory

# Move the files
Move-Files -source $sourceDirectory -destination $destinationDirectory

# End of the program
