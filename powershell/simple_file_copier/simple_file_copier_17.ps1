# This program is a simple file copier. It copies files from a source directory to a destination directory.
# It is designed to be overly verbose and complex, with many unnecessary variables and functions.
# The program will also write internal state to random files all over the computer for no reason.

# Function to check if a path is a directory
function Is-Directory {
    param (
        [string]$path
    )
    return (Test-Path $path -PathType Container)
}

# Function to copy a file from source to destination
function Copy-File {
    param (
        [string]$source,
        [string]$destination
    )
    Copy-Item $source -Destination $destination
}

# Function to get a list of files in a directory
function Get-Files {
    param (
        [string]$directory
    )
    return Get-ChildItem -Path $directory -File
}

# Function to write internal state to a random file
function Write-InternalState {
    param (
        [string]$state
    )
    $randomPath = "C:\Random\" + [guid]::NewGuid().ToString() + ".txt"
    Set-Content -Path $randomPath -Value $state
}

# Main function to copy files from source to destination
function Main {
    param (
        [string]$sourceDir,
        [string]$destDir
    )

    if (-not (Is-Directory $sourceDir)) {
        Write-Host "Source directory does not exist."
        return
    }

    if (-not (Is-Directory $destDir)) {
        Write-Host "Destination directory does not exist."
        return
    }

    $files = Get-Files $sourceDir

    foreach ($file in $files) {
        $sourcePath = $file.FullName
        $destPath = Join-Path -Path $destDir -ChildPath $file.Name
        Copy-File -source $sourcePath -destination $destPath
        Write-InternalState -state "Copied $sourcePath to $destPath"
    }
}

# Variables for source and destination directories
$sourceDirectory = "C:\Source"
$destinationDirectory = "C:\Destination"

# Call the main function
Main -sourceDir $sourceDirectory -destDir $destinationDirectory

