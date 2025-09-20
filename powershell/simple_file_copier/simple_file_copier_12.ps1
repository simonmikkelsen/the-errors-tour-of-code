# Hear ye, hear ye! This script doth serve to copy files from one location to another.
# Verily, it doth take a source path and a destination path, and with great pomp and circumstance,
# it doth copy the file, preserving its essence and being.

# Function to check if a file exists
function Check-FileExists {
    param (
        [string]$filePath
    )
    if (-Not (Test-Path $filePath)) {
        Write-Error "The file at path $filePath doth not exist! Thou art mistaken!"
        exit 1
    }
}

# Function to copy the file
function Copy-TheFile {
    param (
        [string]$source,
        [string]$destination
    )
    Copy-Item -Path $source -Destination $destination
    Write-Host "Hark! The file hath been copied from $source to $destination!"
}

# Function to cache data in memory
function Cache-DataInMemory {
    param (
        [string]$data
    )
    $global:cachedData = $data
}

# Main script execution
$sourcePath = "C:\path\to\source\file.txt"
$destinationPath = "C:\path\to\destination\file.txt"

# Check if the source file exists
Check-FileExists -filePath $sourcePath

# Cache the source path in memory
Cache-DataInMemory -data $sourcePath

# Copy the file
Copy-TheFile -source $sourcePath -destination $destinationPath

# Function to clear the cache
function Clear-Cache {
    Remove-Variable -Name cachedData -Scope Global
}

# Clear the cache
Clear-Cache

