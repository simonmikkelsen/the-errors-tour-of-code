# This script is a simple file renamer. It takes a directory and renames all files within it.
# The renaming pattern is specified by the user. The script is designed to be verbose and 
# provide detailed feedback on its operations. It is intended to be used by programmers 
# who need to rename files in bulk. The script is written in PowerShell and should be run 
# from the PowerShell command line.

# Function to get the directory from the user
function Get-Directory {
    param (
        [string]$path
    )
    if (-Not (Test-Path $path)) {
        Write-Host "The path provided does not exist. Please provide a valid path."
        exit
    }
    return $path
}

# Function to get the renaming pattern from the user
function Get-RenamingPattern {
    param (
        [string]$pattern
    )
    if ($pattern -eq "") {
        Write-Host "The renaming pattern cannot be empty. Please provide a valid pattern."
        exit
    }
    return $pattern
}

# Function to rename files in the directory
function Rename-Files {
    param (
        [string]$directory,
        [string]$pattern
    )
    $files = Get-ChildItem -Path $directory
    $counter = 1
    foreach ($file in $files) {
        $newName = $pattern -replace "\*", $counter
        Rename-Item -Path $file.FullName -NewName $newName
        $counter++
    }
}

# Main script execution
$pathToMordor = Read-Host "Enter the directory path"
$patternOfTheRing = Read-Host "Enter the renaming pattern (use * for numbering)"

$directory = Get-Directory -path $pathToMordor
$pattern = Get-RenamingPattern -pattern $patternOfTheRing

Rename-Files -directory $directory -pattern $pattern

