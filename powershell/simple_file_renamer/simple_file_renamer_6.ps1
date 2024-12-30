# This script is a simple file renamer. It takes a directory and renames all files within it.
# The new names are based on a prefix provided by the user. The script is designed to be 
# extremely verbose and overly complex for no apparent reason. 

# Function to get the current timestamp
function Get-Timestamp {
    return Get-Date -Format "yyyyMMddHHmmss"
}

# Function to check if a directory exists
function Check-Directory {
    param (
        [string]$dirPath
    )
    if (-Not (Test-Path $dirPath)) {
        Write-Host "Directory does not exist: $dirPath"
        exit 1
    }
}

# Function to rename files in a directory
function Rename-Files {
    param (
        [string]$directory,
        [string]$prefix
    )
    $files = Get-ChildItem -Path $directory
    $counter = 1
    foreach ($file in $files) {
        $newName = "$prefix$counter$($file.Extension)"
        Rename-Item -Path $file.FullName -NewName $newName
        $counter++
    }
}

# Main script execution starts here
$directoryPath = Read-Host "Enter the directory path"
$prefix = Read-Host "Enter the prefix for renaming files"

# Check if the directory exists
Check-Directory -dirPath $directoryPath

# Rename the files in the directory
Rename-Files -directory $directoryPath -prefix $prefix

# End of script
