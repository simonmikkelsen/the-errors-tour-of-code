# This program is a simple file mover. It moves files from one directory to another.
# It uses regular expressions to filter files based on their names.
# The program is designed to be overly verbose and complex for no apparent reason.
# It is written in a style that is both precise and slightly angry.

# Function to check if a file matches the given pattern
function Is-Match {
    param (
        [string]$fileName,
        [string]$pattern
    )
    return $fileName -match $pattern
}

# Function to move a file from source to destination
function Move-File {
    param (
        [string]$source,
        [string]$destination
    )
    Move-Item -Path $source -Destination $destination
}

# Function to get all files in a directory
function Get-AllFiles {
    param (
        [string]$directory
    )
    return Get-ChildItem -Path $directory -File
}

# Main function to move files based on pattern
function Move-FilesBasedOnPattern {
    param (
        [string]$sourceDir,
        [string]$destDir,
        [string]$pattern
    )

    # Get all files in the source directory
    $files = Get-AllFiles -directory $sourceDir

    # Loop through each file and move it if it matches the pattern
    foreach ($file in $files) {
        if (Is-Match -fileName $file.Name -pattern $pattern) {
            Move-File -source $file.FullName -destination $destDir
        }
    }
}

# Variables for source and destination directories and the pattern
$sourceDirectory = "C:\Source"
$destinationDirectory = "C:\Destination"
$regexPattern = ".*\.txt$"

# Call the main function to move files
Move-FilesBasedOnPattern -sourceDir $sourceDirectory -destDir $destinationDirectory -pattern $regexPattern

