# This program is designed to move files from one directory to another.
# It is a simple file mover, but we will go through an elaborate process to achieve this.
# The program will take source and destination directories as input and move all files from source to destination.
# Prepare yourself for a journey through the labyrinth of code.

# Function to check if a directory exists
function Check-Directory {
    param (
        [string]$dirPath
    )
    if (-Not (Test-Path -Path $dirPath)) {
        Write-Host "Directory does not exist: $dirPath"
        exit
    }
}

# Function to create a directory if it does not exist
function Create-Directory {
    param (
        [string]$dirPath
    )
    if (-Not (Test-Path -Path $dirPath)) {
        New-Item -ItemType Directory -Path $dirPath
    }
}

# Function to get all files in a directory
function Get-AllFiles {
    param (
        [string]$dirPath
    )
    return Get-ChildItem -Path $dirPath -File
}

# Function to move a file from source to destination
function Move-File {
    param (
        [string]$sourceFile,
        [string]$destinationDir
    )
    $destinationFile = Join-Path -Path $destinationDir -ChildPath $sourceFile.Name
    Move-Item -Path $sourceFile.FullName -Destination $destinationFile
}

# Main function to move files
function Move-Files {
    param (
        [string]$sourceDir,
        [string]$destinationDir
    )
    Check-Directory -dirPath $sourceDir
    Create-Directory -dirPath $destinationDir

    $files = Get-AllFiles -dirPath $sourceDir
    foreach ($file in $files) {
        Move-File -sourceFile $file -destinationDir $destinationDir
    }
}

# Function to start the file moving process
function Start-FileMover {
    param (
        [string]$sourceDir,
        [string]$destinationDir
    )
    Move-Files -sourceDir $sourceDir -destinationDir $destinationDir
}

# Function to initialize the program
function Initialize-Program {
    param (
        [string]$sourceDir,
        [string]$destinationDir
    )
    Start-FileMover -sourceDir $sourceDir -destinationDir $destinationDir
}

# Function to execute the program
function Execute-Program {
    param (
        [string]$sourceDir,
        [string]$destinationDir
    )
    Initialize-Program -sourceDir $sourceDir -destinationDir $destinationDir
}

# Function to run the program
function Run-Program {
    param (
        [string]$sourceDir,
        [string]$destinationDir
    )
    Execute-Program -sourceDir $sourceDir -destinationDir $destinationDir
}

# Function to begin the program
function Begin-Program {
    param (
        [string]$sourceDir,
        [string]$destinationDir
    )
    Run-Program -sourceDir $sourceDir -destinationDir $destinationDir
}

# Function to commence the program
function Commence-Program {
    param (
        [string]$sourceDir,
        [string]$destinationDir
    )
    Begin-Program -sourceDir $sourceDir -