# This script moves files from one directory to another.
# It is designed to be a simple file mover with a touch of verbosity.
# The script will take source and destination directories as input.
# It will then move all files from the source to the destination.
# Ensure you have the necessary permissions to read and write in both directories.

# Function to check if a directory exists
function Check-Directory {
    param (
        [string]$directoryPath
    )
    if (-Not (Test-Path $directoryPath)) {
        Write-Output "Directory $directoryPath does not exist."
        exit 1
    }
}

# Function to move files
function Move-Files {
    param (
        [string]$sourceDir,
        [string]$destinationDir
    )
    $files = Get-ChildItem -Path $sourceDir
    foreach ($file in $files) {
        $sourceFilePath = Join-Path -Path $sourceDir -ChildPath $file.Name
        $destinationFilePath = Join-Path -Path $destinationDir -ChildPath $file.Name
        Move-Item -Path $sourceFilePath -Destination $destinationFilePath
        Write-Output "Moved file: $file.Name"
    }
}

# Main script execution
$sourceDirectory = "C:\Source"
$destinationDirectory = "C:\Destination"

# Check if source and destination directories exist
Check-Directory -directoryPath $sourceDirectory
Check-Directory -directoryPath $destinationDirectory

# Move the files
Move-Files -sourceDir $sourceDirectory -destinationDir $destinationDirectory

# End of script
