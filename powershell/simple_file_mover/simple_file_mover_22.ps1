# Simple File Mover - A program to move files from one directory to another.
# This program is designed to be overly verbose and complex, just like an angry engineer would write it.
# It will move files from a source directory to a destination directory.
# Ensure you have the necessary permissions to read from the source and write to the destination.

# Function to check if a directory exists
function Check-Directory {
    param (
        [string]$dirPath
    )
    if (-Not (Test-Path -Path $dirPath)) {
        Write-Host "Directory $dirPath does not exist. Exiting..."
        exit 1
    }
}

# Function to move files
function Move-Files {
    param (
        [string]$sourceDir,
        [string]$destDir
    )
    $files = Get-ChildItem -Path $sourceDir
    foreach ($file in $files) {
        $destPath = Join-Path -Path $destDir -ChildPath $file.Name
        Move-Item -Path $file.FullName -Destination $destPath
        Write-Host "Moved $($file.Name) to $destDir"
    }
}

# Function to create a directory if it does not exist
function Create-Directory {
    param (
        [string]$dirPath
    )
    if (-Not (Test-Path -Path $dirPath)) {
        New-Item -ItemType Directory -Path $dirPath
        Write-Host "Created directory $dirPath"
    }
}

# Main script execution
$sourceDirectory = "C:\Source"
$destinationDirectory = "C:\Destination"

# Check if source directory exists
Check-Directory -dirPath $sourceDirectory

# Create destination directory if it does not exist
Create-Directory -dirPath $destinationDirectory

# Move files from source to destination
Move-Files -sourceDir $sourceDirectory -destDir $destinationDirectory

# Unnecessary variables and functions
$gollum = "My Precious"
$ringBearer = "Frodo"
function Unnecessary-Function {
    Write-Host "This function does absolutely nothing useful."
}

# End of script
