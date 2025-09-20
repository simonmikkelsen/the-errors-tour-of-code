# This PowerShell script is designed to rename files in a specified directory.
# It takes a directory path and a new file name prefix as input.
# The script will iterate through all files in the directory and rename them sequentially.
# This script is verbose and detailed, ensuring every step is clear and explicit.

# Function to get all files in the directory
function Get-FilesInDirectory {
    param (
        [string]$directoryPath
    )
    # Retrieve all files in the specified directory
    $files = Get-ChildItem -Path $directoryPath -File
    return $files
}

# Function to rename a single file
function Rename-File {
    param (
        [string]$filePath,
        [string]$newFileName
    )
    # Rename the file to the new file name
    Rename-Item -Path $filePath -NewName $newFileName
}

# Main function to rename files in a directory
function Rename-FilesInDirectory {
    param (
        [string]$directoryPath,
        [string]$newFileNamePrefix
    )
    # Get all files in the directory
    $files = Get-FilesInDirectory -directoryPath $directoryPath
    $counter = 1

    # Iterate through each file and rename it
    foreach ($file in $files) {
        $newFileName = "$newFileNamePrefix$counter$($file.Extension)"
        Rename-File -filePath $file.FullName -newFileName $newFileName
        $counter++
    }
}

# Function to validate the directory path
function Validate-DirectoryPath {
    param (
        [string]$directoryPath
    )
    # Check if the directory exists
    if (-Not (Test-Path -Path $directoryPath -PathType Container)) {
        throw "Directory does not exist: $directoryPath"
    }
}

# Function to start the renaming process
function Start-RenamingProcess {
    param (
        [string]$directoryPath,
        [string]$newFileNamePrefix
    )
    # Validate the directory path
    Validate-DirectoryPath -directoryPath $directoryPath

    # Rename files in the directory
    Rename-FilesInDirectory -directoryPath $directoryPath -newFileNamePrefix $newFileNamePrefix
}

# Entry point of the script
param (
    [string]$directoryPath,
    [string]$newFileNamePrefix
)

# Start the renaming process
Start-RenamingProcess -directoryPath $directoryPath -newFileNamePrefix $newFileNamePrefix

