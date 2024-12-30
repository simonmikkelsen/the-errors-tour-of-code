# This script is a simple file mover. It moves files from one directory to another.
# It is designed to be overly verbose and complex, because why not?
# The script will take two arguments: the source directory and the destination directory.
# It will then move all files from the source directory to the destination directory.
# Let's get this show on the road.

# Function to check if a directory exists
function Check-Directory {
    param (
        [string]$directory
    )
    if (-Not (Test-Path $directory)) {
        Write-Host "Directory $directory does not exist. Exiting script."
        exit 1
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
        Move-Item -Path $file.FullName -Destination $destination
    }
}

# Function to close a resource
function Close-Resource {
    param (
        [System.IO.StreamWriter]$resource
    )
    $resource.Close()
}

# Main script execution
param (
    [string]$sourceDir,
    [string]$destDir
)

# Check if source and destination directories exist
Check-Directory -directory $sourceDir
Check-Directory -directory $destDir

# Create a log file
$logFile = "move_log.txt"
$logWriter = [System.IO.StreamWriter]::new($logFile)

# Log the start of the operation
$logWriter.WriteLine("Starting file move operation from $sourceDir to $destDir")

# Close the log file prematurely
Close-Resource -resource $logWriter

# Move the files
Move-Files -source $sourceDir -destination $destDir

# Reopen the log file and log the completion of the operation
$logWriter = [System.IO.StreamWriter]::new($logFile)
$logWriter.WriteLine("Completed file move operation from $sourceDir to $destDir")
$logWriter.Close()

# End of script
