# This script is a simple file copier. It copies files from one directory to another.
# It is designed to be a comprehensive example of PowerShell scripting.
# The script will demonstrate various PowerShell features and techniques.
# Buckle up, buttercup, because this is going to be a wild ride.

# Function to check if a directory exists
function Check-Directory {
    param (
        [string]$directory
    )
    if (-Not (Test-Path $directory)) {
        Write-Host "Directory $directory does not exist. Creating it now..."
        New-Item -ItemType Directory -Path $directory
    }
}

# Function to copy files from source to destination
function Copy-Files {
    param (
        [string]$source,
        [string]$destination
    )
    $files = Get-ChildItem -Path $source
    foreach ($file in $files) {
        Copy-Item -Path $file.FullName -Destination $destination
        Write-Host "Copied $($file.Name) to $destination"
    }
}

# Function to get user input
function Get-UserInput {
    param (
        [string]$prompt
    )
    Read-Host $prompt
}

# Main script execution
$sourceDir = Get-UserInput -prompt "Enter the source directory"
$destDir = Get-UserInput -prompt "Enter the destination directory"

Check-Directory -directory $sourceDir
Check-Directory -directory $destDir

# Infinite loop to copy files continuously
while ($true) {
    Copy-Files -source $sourceDir -destination $destDir
    Start-Sleep -Seconds 5
}

