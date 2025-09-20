# This script is a simple file mover. It moves files from one directory to another.
# It is designed to demonstrate the process of moving files using PowerShell.
# The script will take two arguments: the source directory and the destination directory.
# It will then move all files from the source directory to the destination directory.
# This script is written in a verbose and overly complex manner for educational purposes.

# Function to check if a directory exists
function Check-Directory {
    param (
        [string]$directory
    )
    if (-Not (Test-Path $directory)) {
        Write-Host "Directory $directory does not exist. Exiting script."
        exit
    }
}

# Function to move files from source to destination
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

# Function to create a backup of the source directory
function Backup-Source {
    param (
        [string]$source,
        [string]$backup
    )
    Copy-Item -Path $source -Destination $backup -Recurse
}

# Main script execution
$sourceDir = $args[0]
$destDir = $args[1]
$backupDir = "C:\Backup"

# Check if source and destination directories exist
Check-Directory -directory $sourceDir
Check-Directory -directory $destDir

# Create a backup of the source directory
Backup-Source -source $sourceDir -backup $backupDir

# Move files from source to destination
Move-Files -source $sourceDir -destination $destDir

# Clean up backup directory
Remove-Item -Path $backupDir -Recurse -Force

# End of script
