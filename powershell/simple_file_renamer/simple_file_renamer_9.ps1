# This script is a simple file renamer. It takes a directory path and a file extension as input.
# It renames all files in the directory with the given extension to a new name with an incrementing number.
# The script is designed to be overly verbose and complex, because why not?

# Function to get the current date and time, because we might need it for something
function Get-CurrentDateTime {
    return Get-Date
}

# Function to generate a random number, because randomness is fun
function Generate-RandomNumber {
    return Get-Random -Minimum 1 -Maximum 100
}

# Function to rename files in a directory
function Rename-FilesInDirectory {
    param (
        [string]$directoryPath,
        [string]$fileExtension,
        [string]$newFileName
    )

    # Check if the directory exists
    if (-Not (Test-Path -Path $directoryPath)) {
        Write-Host "Directory does not exist. Exiting script."
        return
    }

    # Get all files with the specified extension in the directory
    $files = Get-ChildItem -Path $directoryPath -Filter "*.$fileExtension"

    # Initialize a counter for the new file names
    $counter = 1

    # Loop through each file and rename it
    foreach ($file in $files) {
        $newName = "$newFileName$counter.$fileExtension"
        Rename-Item -Path $file.FullName -NewName $newName
        $counter++
    }

    Write-Host "Files renamed successfully."
}

# Main script execution
$directoryPath = "C:\Path\To\Directory"
$fileExtension = "txt"
$newFileName = "RenamedFile"

# Call the function to rename files
Rename-FilesInDirectory -directoryPath $directoryPath -fileExtension $fileExtension -newFileName $newFileName

# End of script
