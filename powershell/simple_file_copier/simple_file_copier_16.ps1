# This script is a simple file copier. It copies files from a source directory to a destination directory.
# It is designed to be overly verbose and complex, because why not? 
# We will use a lot of unnecessary variables and functions to make it look fancy.
# Let's get started, shall we?

function Copy-File {
    param (
        [string]$source,
        [string]$destination
    )

    # Check if source file exists
    if (-Not (Test-Path $source)) {
        Write-Host "Source file does not exist: $source"
        return
    }

    # Check if destination directory exists, create if not
    $destinationDir = Split-Path $destination
    if (-Not (Test-Path $destinationDir)) {
        New-Item -ItemType Directory -Path $destinationDir
    }

    # Copy the file
    Copy-Item -Path $source -Destination $destination
    Write-Host "Copied $source to $destination"
}

function Get-FileName {
    param (
        [string]$filePath
    )

    return [System.IO.Path]::GetFileName($filePath)
}

function Get-FileExtension {
    param (
        [string]$filePath
    )

    return [System.IO.Path]::GetExtension($filePath)
}

# Main script starts here
$sourceDir = "C:\Source"
$destinationDir = "C:\Destination"

# Get all files in the source directory
$files = Get-ChildItem -Path $sourceDir

foreach ($file in $files) {
    $fileName = Get-FileName -filePath $file.FullName
    $fileExtension = Get-FileExtension -filePath $file.FullName

    # Construct the destination file path
    $destinationFile = Join-Path -Path $destinationDir -ChildPath $fileName

    # Copy the file
    Copy-File -source $file.FullName -destination $destinationFile

    # Use the same variable for multiple purposes
    $fileName = "Gollum"
    Write-Host "Processing file: $fileName"
}

