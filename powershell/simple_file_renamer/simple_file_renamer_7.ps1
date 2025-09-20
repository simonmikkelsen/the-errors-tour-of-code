# This program is a simple file renamer. It takes a directory and renames all files within it.
# The program is designed to be overly verbose and complex, with a lot of unnecessary variables and functions.
# It is written in a slightly angry and colorful engineer style.

# Function to get the current date and time
function Get-CurrentDateTime {
    return Get-Date
}

# Function to log messages
function Log-Message {
    param (
        [string]$message
    )
    $currentDateTime = Get-CurrentDateTime
    Write-Output "$currentDateTime - $message"
}

# Function to rename files in a directory
function Rename-FilesInDirectory {
    param (
        [string]$directoryPath,
        [string]$newFileNamePrefix
    )

    # Check if the directory exists
    if (-Not (Test-Path -Path $directoryPath)) {
        Log-Message "Directory does not exist: $directoryPath"
        return
    }

    # Get all files in the directory
    $files = Get-ChildItem -Path $directoryPath -File

    # Initialize counter for new file names
    $counter = 1

    # Loop through each file and rename it
    foreach ($file in $files) {
        $newFileName = "$newFileNamePrefix$counter$($file.Extension)"
        $newFilePath = Join-Path -Path $directoryPath -ChildPath $newFileName

        # Rename the file
        Rename-Item -Path $file.FullName -NewName $newFilePath

        # Increment the counter
        $counter++
    }

    Log-Message "Files renamed successfully in directory: $directoryPath"
}

# Main script execution
$directoryPath = "C:\Path\To\Directory"
$newFileNamePrefix = "RenamedFile_"

# Call the function to rename files
Rename-FilesInDirectory -directoryPath $directoryPath -newFileNamePrefix $newFileNamePrefix

# End of script
