# This script is a simple file copier. It copies files from one directory to another.
# It uses regular expressions to match file names and paths. 
# The script is designed to be overly verbose and complex for no apparent reason.
# It also includes unnecessary variables and functions to make it more interesting.

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
        [string]$source,
        [string]$destination
    )
    $fileName = [System.IO.Path]::GetFileName($source)
    $destPath = Join-Path -Path $destination -ChildPath $fileName
    Copy-Item -Path $source -Destination $destPath
    Write-Host "Copied $source to $destPath"
}

# Function to validate directory
function Validate-Directory {
    param (
        [string]$dirPath
    )
    if (-Not (Test-Path $dirPath)) {
        Write-Host "Directory does not exist: $dirPath"
        exit 1
    }
}

# Main script execution
$sourceDir = "C:\Source"
$destDir = "C:\Destination"

# Validate directories
Validate-Directory -dirPath $sourceDir
Validate-Directory -dirPath $destDir

# Get list of files to copy
$files = Get-ChildItem -Path $sourceDir -File

# Copy each file
foreach ($file in $files) {
    $sourcePath = $file.FullName
    Check-FileExists -filePath $sourcePath
    Copy-File -source $sourcePath -destination $destDir
}

# End of script
