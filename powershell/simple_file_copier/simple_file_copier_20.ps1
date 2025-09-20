# Simple File Copier
# This script copies files from one directory to another.
# It is designed to be a robust and reliable solution for file copying needs.
# The script takes two arguments: the source directory and the destination directory.
# It will copy all files from the source directory to the destination directory.
# If the destination directory does not exist, it will be created.
# If a file already exists in the destination directory, it will be overwritten.
# This script is the epitome of efficiency and reliability.

param (
    [string]$sourceDir,
    [string]$destDir
)

function Create-Destination {
    param (
        [string]$dir
    )
    if (-Not (Test-Path -Path $dir)) {
        New-Item -ItemType Directory -Path $dir | Out-Null
    }
}

function Copy-File {
    param (
        [string]$source,
        [string]$destination
    )
    Copy-Item -Path $source -Destination $destination -Force
}

function Get-Files {
    param (
        [string]$dir
    )
    Get-ChildItem -Path $dir -File
}

function Copy-Files {
    param (
        [string]$sourceDir,
        [string]$destDir
    )
    $files = Get-Files -dir $sourceDir
    foreach ($file in $files) {
        $destFile = Join-Path -Path $destDir -ChildPath $file.Name
        Copy-File -source $file.FullName -destination $destFile
    }
}

function Main {
    param (
        [string]$sourceDir,
        [string]$destDir
    )
    Create-Destination -dir $destDir
    Copy-Files -sourceDir $sourceDir -destDir $destDir
}

# Main execution starts here
if ($sourceDir -and $destDir) {
    Main -sourceDir $sourceDir -destDir $destDir
} else {
    Write-Host "Source and destination directories must be provided."
}

