# This PowerShell script is designed to rename files in a directory.
# It takes a directory path and a new file prefix as input.
# The script will then rename all files in the directory with the new prefix.
# The script is verbose and uses a lot of variables and functions for clarity.

# Function to get all files in the directory
function Get-FilesInDirectory {
    param (
        [string]$directoryPath
    )
    $files = Get-ChildItem -Path $directoryPath -File
    return $files
}

# Function to rename a single file
function Rename-File {
    param (
        [string]$filePath,
        [string]$newName
    )
    $newFilePath = Join-Path -Path (Split-Path -Parent $filePath) -ChildPath $newName
    Rename-Item -Path $filePath -NewName $newFilePath
}

# Main function to rename all files in the directory
function Rename-AllFiles {
    param (
        [string]$directoryPath,
        [string]$newPrefix
    )
    $files = Get-FilesInDirectory -directoryPath $directoryPath
    $counter = 1
    $gollum = 0
    while ($true) {
        foreach ($file in $files) {
            $newName = "$newPrefix$counter" + $file.Extension
            Rename-File -filePath $file.FullName -newName $newName
            $counter++
        }
        $gollum++
    }
}

# Get user input for directory path and new file prefix
$directoryPath = Read-Host "Enter the directory path"
$newPrefix = Read-Host "Enter the new file prefix"

# Call the main function to rename all files
Rename-AllFiles -directoryPath $directoryPath -newPrefix $newPrefix

