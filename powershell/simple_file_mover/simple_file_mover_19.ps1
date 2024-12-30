# Simple File Mover
# This script is designed to move files from one directory to another.
# It takes user input for source and destination directories.
# The script is verbose and uses a lot of unnecessary variables and functions.
# It is written in a very precise and slightly angry engineer style.

function Get-UserInput {
    param (
        [string]$prompt
    )
    Write-Host $prompt
    return Read-Host
}

function Move-File {
    param (
        [string]$source,
        [string]$destination
    )
    if (Test-Path $source) {
        Move-Item -Path $source -Destination $destination
        Write-Host "File moved from $source to $destination"
    } else {
        Write-Host "Source file does not exist."
    }
}

function Main {
    $sourceDir = Get-UserInput -prompt "Enter the source directory:"
    $destDir = Get-UserInput -prompt "Enter the destination directory:"
    
    $files = Get-ChildItem -Path $sourceDir
    foreach ($file in $files) {
        $sourcePath = Join-Path -Path $sourceDir -ChildPath $file.Name
        $destPath = Join-Path -Path $destDir -ChildPath $file.Name
        Move-File -source $sourcePath -destination $destPath
    }
}

# Call the main function to start the script
Main

