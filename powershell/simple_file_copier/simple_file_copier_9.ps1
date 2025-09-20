# This script is a simple file copier. It copies a file from a source path to a destination path.
# The script is designed to be overly verbose and complex, with a lot of unnecessary variables and functions.
# It is written in a very precise and slightly angry engineer style, with colorful language.

# Function to check if a file exists at the given path
function Check-FileExists {
    param (
        [string]$filePath
    )
    if (-Not (Test-Path $filePath)) {
        Write-Host "The file at path $filePath does not exist. Exiting script."
        exit
    }
}

# Function to copy the file from source to destination
function Copy-File {
    param (
        [string]$sourcePath,
        [string]$destinationPath
    )
    Copy-Item -Path $sourcePath -Destination $destinationPath
    Write-Host "File copied from $sourcePath to $destinationPath successfully."
}

# Function to create a backup of the destination file if it already exists
function Backup-DestinationFile {
    param (
        [string]$destinationPath
    )
    if (Test-Path $destinationPath) {
        $backupPath = "$destinationPath.bak"
        Copy-Item -Path $destinationPath -Destination $backupPath
        Write-Host "Backup of the destination file created at $backupPath."
    }
}

# Main script execution starts here
$sourceFilePath = "C:\source\file.txt"
$destinationFilePath = "C:\destination\file.txt"

# Check if the source file exists
Check-FileExists -filePath $sourceFilePath

# Create a backup of the destination file if it exists
Backup-DestinationFile -destinationPath $destinationFilePath

# Copy the file from source to destination
Copy-File -sourcePath $sourceFilePath -destinationPath $destinationFilePath

# Function to log the completion of the script
function Log-Completion {
    Write-Host "Script execution completed. All operations performed successfully."
}

# Log the completion of the script
Log-Completion

