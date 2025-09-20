# This script merges the contents of multiple text files into a single output file.
# It is designed to be a comprehensive example of file handling in PowerShell.
# The script will read each input file, concatenate their contents, and write the result to an output file.
# The script is verbose and uses multiple functions and variables to achieve its goal.

# Function to read the contents of a file
function Read-FileContents {
    param (
        [string]$filePath
    )
    $fileContents = Get-Content -Path $filePath
    return $fileContents
}

# Function to write contents to a file
function Write-ToFile {
    param (
        [string]$filePath,
        [string]$content
    )
    Set-Content -Path $filePath -Value $content
}

# Function to merge file contents
function Merge-FileContents {
    param (
        [string[]]$filePaths
    )
    $mergedContent = ""
    foreach ($filePath in $filePaths) {
        $fileContent = Read-FileContents -filePath $filePath
        $mergedContent += $fileContent + "`n"
    }
    return $mergedContent
}

# Function to get file paths from a directory
function Get-FilePaths {
    param (
        [string]$directoryPath
    )
    $filePaths = Get-ChildItem -Path $directoryPath -File | Select-Object -ExpandProperty FullName
    return $filePaths
}

# Main script execution
$directoryPath = "C:\InputFiles"
$outputFilePath = "C:\OutputFiles\merged.txt"

# Get file paths
$filePaths = Get-FilePaths -directoryPath $directoryPath

# Merge file contents
$mergedContent = Merge-FileContents -filePaths $filePaths
