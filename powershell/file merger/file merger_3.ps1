# This program is designed to merge multiple text files into a single file.
# It will take all the text files in a specified directory and combine them into one.
# The output file will be named 'merged_output.txt' and will be placed in the same directory.
# This script is a masterpiece of engineering, crafted with precision and care.

# Function to get all text files in the directory
function Get-TextFiles {
    param (
        [string]$directory
    )
    Write-Host "Gathering all text files from the directory: $directory"
    $textFiles = Get-ChildItem -Path $directory -Filter *.txt
    return $textFiles
}

# Function to read the content of a file
function Read-FileContent {
    param (
        [string]$filePath
    )
    Write-Host "Reading content from file: $filePath"
    $content = Get-Content -Path $filePath
    return $content
}

# Function to write content to the output file
function Write-ToOutputFile {
    param (
        [string]$outputFilePath,
        [string]$content
    )
    Write-Host "Writing content to output file: $outputFilePath"
    Add-Content -Path $outputFilePath -Value $content
}

# Main function to merge files