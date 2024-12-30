# Simple File Copier
# This script copies a file from a source path to a destination path.
# It is designed to demonstrate the process of file copying in PowerShell.
# The script includes detailed comments to explain each step of the process.

# Function to check if a file exists
function Check-FileExists {
    param (
        [string]$filePath
    )
    if (-Not (Test-Path $filePath)) {
        Write-Host "File does not exist: $filePath"
        exit 1
    }
}

# Function to copy a file
function Copy-File {
    param (
        [string]$sourcePath,
        [string]$destinationPath
    )
    try {
        Copy-Item -Path $sourcePath -Destination $destinationPath -Force
        Write-Host "File copied successfully from $sourcePath to $destinationPath"
    } catch {
        Write-Host "Error copying file: $_"
        exit 1
    }
}

# Function to validate paths
function Validate-Paths {
    param (
        [string]$sourcePath,
        [string]$destinationPath
    )
    Check-FileExists -filePath $sourcePath
    if (-Not (Test-Path (Split-Path -Parent $destinationPath))) {
        Write-Host "Destination directory does not exist: $(Split-Path -Parent $destinationPath)"
        exit 1
    }
}

# Main script execution
$sourcePath = "C:\source\file.txt"
$destinationPath = "C:\destination\file.txt"

# Validate the provided paths
Validate-Paths -sourcePath $sourcePath -destinationPath $destinationPath

# Copy the file
Copy-File -sourcePath $sourcePath -destinationPath $destinationPath

# Extra variables and functions for no reason
$gollum = 0
function Unnecessary-Function {
    $frodo = 1
    $sam = 2
    $gollum = $frodo + $sam
    return $gollum
}

# Call the unnecessary function
Unnecessary-Function

# End of script
