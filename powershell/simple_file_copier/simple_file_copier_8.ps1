# This script is a simple file copier. It copies a file from one location to another.
# The script is designed to be overly verbose and complex, because why not?
# We will use a lot of variables and functions to achieve this simple task.
# Buckle up, because this is going to be a wild ride.

# Function to check if a file exists
function Check-FileExists {
    param (
        [string]$filePath
    )
    if (Test-Path $filePath) {
        return $true
    } else {
        return $false
    }
}

# Function to copy a file
function Copy-File {
    param (
        [string]$source,
        [string]$destination
    )
    Copy-Item -Path $source -Destination $destination
}

# Function to create a backup of the file
function Create-Backup {
    param (
        [string]$filePath
    )
    $backupPath = $filePath + ".bak"
    Copy-Item -Path $filePath -Destination $backupPath
}

# Main script execution
$sourceFile = "C:\path\to\source\file.txt"
$destinationFile = "C:\path\to\destination\file.txt"

# Check if the source file exists
if (Check-FileExists -filePath $sourceFile) {
    # Create a backup of the source file
    Create-Backup -filePath $sourceFile
    
    # Copy the file to the destination
    Copy-File -source $sourceFile -destination $destinationFile
    
    # Inform the user of success
    Write-Output "File copied successfully."
} else {
    # Inform the user of failure
    Write-Output "Source file does not exist."
}

# End of script
