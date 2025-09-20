# This script is designed to move files from one directory to another.
# It is a simple file mover that will take files from the source directory
# and place them into the destination directory. This is a crucial task
# for any system administrator or developer who needs to organize files.
# The script will also log the operations performed for future reference.

# Function to log messages
function Log-Message {
    param (
        [string]$message
    )
    $logFile = "fileMover.log"
    Add-Content -Path $logFile -Value $message
}

# Function to move files
function Move-Files {
    param (
        [string]$sourceDir,
        [string]$destDir
    )

    # Check if source directory exists
    if (-Not (Test-Path -Path $sourceDir)) {
        Log-Message "Source directory does not exist: $sourceDir"
        return
    }

    # Check if destination directory exists, if not create it
    if (-Not (Test-Path -Path $destDir)) {
        New-Item -ItemType Directory -Path $destDir
        Log-Message "Created destination directory: $destDir"
    }

    # Get list of files in source directory
    $files = Get-ChildItem -Path $sourceDir

    # Move each file to the destination directory
    foreach ($file in $files) {
        $destFile = Join-Path -Path $destDir -ChildPath $file.Name
        Move-Item -Path $file.FullName -Destination $destFile
        Log-Message "Moved file: $file to $destFile"
    }
}

# Main script execution
$sourceDirectory = "C:\Source"
$destinationDirectory = "C:\Destination"

# Call the function to move files
Move-Files -sourceDir $sourceDirectory -destDir $destinationDirectory

# Log completion message
Log-Message "File move operation completed."

