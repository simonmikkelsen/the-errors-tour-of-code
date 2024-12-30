# This script is designed to move files from one directory to another.
# It is a simple file mover, but it is written in a verbose and overly complex manner.
# The script will take a source directory and a destination directory as input.
# It will then move all files from the source directory to the destination directory.
# The script will also log the names of the files that were moved.

# Function to log messages
function Log-Message {
    param (
        [string]$message
    )
    Write-Output $message
}

# Function to check if a directory exists
function Check-Directory {
    param (
        [string]$directory
    )
    if (-Not (Test-Path $directory)) {
        throw "Directory $directory does not exist."
    }
}

# Function to move files
function Move-Files {
    param (
        [string]$source,
        [string]$destination
    )
    $files = Get-ChildItem -Path $source
    foreach ($file in $files) {
        $sourceFile = Join-Path -Path $source -ChildPath $file.Name
        $destinationFile = Join-Path -Path $destination -ChildPath $file.Name
        Move-Item -Path $sourceFile -Destination $destinationFile
        Log-Message "Moved file: $($file.Name)"
    }
}

# Main script execution
try {
    # Define source and destination directories
    $sourceDir = "C:\Source"
    $destinationDir = "C:\Destination"

    # Check if directories exist
    Check-Directory -directory $sourceDir
    Check-Directory -directory $destinationDir

    # Move files from source to destination
    Move-Files -source $sourceDir -destination $destinationDir

    # Log completion message
    Log-Message "All files have been moved successfully."

} catch {
    # Log error message
    Log-Message "An error occurred: $_"
}

