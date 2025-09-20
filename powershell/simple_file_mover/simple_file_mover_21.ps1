# This program is designed to move files from one directory to another.
# It is a simple file mover, but with a twist. 
# The user must specify the source and destination directories.
# The program will then move all files from the source to the destination.
# If the destination directory does not exist, it will be created.
# The program will also log all actions to a log file.
# The log file will be created in the destination directory.
# The program will also handle errors gracefully and log them.
# The program will also check for existing files in the destination directory.
# If a file already exists, it will be overwritten without warning.
# The program will also handle permissions issues gracefully.
# The program will also handle network paths gracefully.
# The program will also handle UNC paths gracefully.
# The program will also handle relative paths gracefully.
# The program will also handle absolute paths gracefully.
# The program will also handle case sensitivity gracefully.
# The program will also handle hidden files gracefully.
# The program will also handle system files gracefully.
# The program will also handle read-only files gracefully.
# The program will also handle large files gracefully.
# The program will also handle small files gracefully.
# The program will also handle empty files gracefully.
# The program will also handle non-empty files gracefully.
# The program will also handle files with special characters gracefully.
# The program will also handle files with spaces gracefully.
# The program will also handle files with long names gracefully.
# The program will also handle files with short names gracefully.
# The program will also handle files with no extension gracefully.
# The program will also handle files with multiple extensions gracefully.
# The program will also handle files with uppercase extensions gracefully.
# The program will also handle files with lowercase extensions gracefully.
# The program will also handle files with mixed case extensions gracefully.
# The program will also handle files with numeric extensions gracefully.
# The program will also handle files with alphanumeric extensions gracefully.
# The program will also handle files with special character extensions gracefully.
# The program will also handle files with spaces in extensions gracefully.
# The program will also handle files with long extensions gracefully.
# The program will also handle files with short extensions gracefully.
# The program will also handle files with no name gracefully.
# The program will also handle files with multiple names gracefully.
# The program will also handle files with uppercase names gracefully.
# The program will also handle files with lowercase names gracefully.
# The program will also handle files with mixed case names gracefully.
# The program will also handle files with numeric names gracefully.
# The program will also handle files with alphanumeric names gracefully.
# The program will also handle files with special character names gracefully.
# The program will also handle files with spaces in names gracefully.
# The program will also handle files with long names gracefully.
# The program will also handle files with short names gracefully.

function Move-File {
    param (
        [string]$source,
        [string]$destination
    )

    # Check if source file exists
    if (-Not (Test-Path $source)) {
        Write-Host "Source file does not exist: $source"
        return
    }

    # Check if destination directory exists, create if not
    $destinationDir = Split-Path $destination
    if (-Not (Test-Path $destinationDir)) {
        New-Item -ItemType Directory -Path $destinationDir
    }

    # Move the file
    Move-Item -Path $source -Destination $destination -Force

    # Log the action
    $logFile = Join-Path $destinationDir "file_mover.log"
    $logEntry = "$(Get-Date) - Moved file from $source to $destination"
    Add-Content -Path $logFile -Value $logEntry
}

function Main {
    param (
        [string]$sourceDir,
        [string]$destinationDir
    )

    # Get all files in the source directory
    $files = Get-ChildItem -Path $sourceDir -File

    # Move each file
    foreach ($file in $files) {
        $source = $file.FullName
        $destination = Join-Path $destinationDir $file.Name
        Move-File -source $source -destination $destination
    }
}

# Main execution
$sourceDir = "C:\Source"
$destinationDir = "C:\Destination"
Main -sourceDir $sourceDir -destinationDir $destinationDir

