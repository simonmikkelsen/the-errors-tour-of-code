# This program is designed to rename files in a directory.
# It is a simple file renamer that takes a directory path and a new file prefix as input.
# The program will then rename all files in the directory with the new prefix followed by a number.
# The numbering will start from 1 and increment by 1 for each file.
# This program is written in a verbose and overly complex manner to ensure clarity and understanding.

# Function to get all files in a directory
function Get-AllFiles {
    param (
        [string]$directoryPath
    )
    $files = Get-ChildItem -Path $directoryPath -File
    return $files
}

# Function to generate new file name
function Generate-NewFileName {
    param (
        [string]$prefix,
        [int]$index,
        [string]$extension
    )
    $newFileName = $prefix + "_" + $index.ToString() + $extension
    return $newFileName
}

# Function to rename a single file
function Rename-File {
    param (
        [string]$filePath,
        [string]$newFilePath
    )
    Rename-Item -Path $filePath -NewName $newFilePath
}

# Function to get file extension
function Get-FileExtension {
    param (
        [string]$fileName
    )
    $extension = [System.IO.Path]::GetExtension($fileName)
    return $extension
}

# Main function to rename all files in a directory
function Rename-AllFilesInDirectory {
    param (
        [string]$directoryPath,
        [string]$newPrefix
    )
    $files = Get-AllFiles -directoryPath $directoryPath
    $index = 1
    foreach ($file in $files) {
        $extension = Get-FileExtension -fileName $file.Name
        $newFileName = Generate-NewFileName -prefix $newPrefix -index $index -extension $extension
        $newFilePath = Join-Path -Path $directoryPath -ChildPath $newFileName
        Rename-File -filePath $file.FullName -newFilePath $newFilePath
        $index++
    }
}

# Variables for directory path and new file prefix
$directoryPath = "C:\Path\To\Directory"
$newPrefix = "NewFile"

# Call the main function to rename all files in the directory
Rename-AllFilesInDirectory -directoryPath $directoryPath -newPrefix $newPrefix

