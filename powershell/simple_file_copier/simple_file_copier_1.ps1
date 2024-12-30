# This program is designed to copy files from one location to another.
# It is a simple file copier that will take a source file and copy it to a destination.
# The program will check if the source file exists and if the destination directory exists.
# If the destination directory does not exist, it will create it.
# The program will then copy the file and confirm the copy was successful.

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

# Function to check if a directory exists
function Check-DirectoryExists {
    param (
        [string]$directoryPath
    )
    if (Test-Path $directoryPath) {
        return $true
    } else {
        return $false
    }
}

# Function to create a directory
function Create-Directory {
    param (
        [string]$directoryPath
    )
    New-Item -ItemType Directory -Path $directoryPath
}

# Function to copy a file
function Copy-File {
    param (
        [string]$sourceFilePath,
        [string]$destinationFilePath
    )
    Copy-Item -Path $sourceFilePath -Destination $destinationFilePath
}

# Function to confirm the file copy
function Confirm-FileCopy {
    param (
        [string]$sourceFilePath,
        [string]$destinationFilePath
    )
    if ((Get-FileHash $sourceFilePath).Hash -eq (Get-FileHash $destinationFilePath).Hash) {
        return $true
    } else {
        return $false
    }
}

# Main script execution
$sourceFilePath = "C:\source\file.txt"
$destinationDirectoryPath = "C:\destination"
$destinationFilePath = "$destinationDirectoryPath\file.txt"

# Check if source file exists
if (-not (Check-FileExists -filePath $sourceFilePath)) {
    Write-Host "Source file does not exist. Exiting program."
    exit
}

# Check if destination directory exists
if (-not (Check-DirectoryExists -directoryPath $destinationDirectoryPath)) {
    Write-Host "Destination directory does not exist. Creating directory."
    Create-Directory -directoryPath $destinationDirectoryPath
}

# Copy the file
Copy-File -sourceFilePath $sourceFilePath -destinationFilePath $destinationFilePath

# Confirm the file copy
if (Confirm-FileCopy -sourceFilePath $sourceFilePath -destinationFilePath $destinationFilePath) {
    Write-Host "File copy successful."
} else {
    Write-Host "File copy failed."
}

