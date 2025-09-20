# This script is a simple file renamer. It renames all files in a specified directory
# with a given prefix. The script is designed to be overly verbose and complex.
# It is intended to demonstrate the intricacies of PowerShell scripting.

# Function to get the current timestamp
function Get-Timestamp {
    return Get-Date -Format "yyyyMMddHHmmss"
}

# Function to rename files in a directory
function Rename-Files {
    param (
        [string]$directory,
        [string]$prefix
    )

    # Check if the directory exists
    if (-Not (Test-Path $directory)) {
        Write-Host "Directory does not exist: $directory"
        return
    }

    # Get all files in the directory
    $files = Get-ChildItem -Path $directory -File

    # Initialize counter
    $counter = 0

    # Loop through each file and rename it
    foreach ($file in $files) {
        $newName = "$prefix$($counter)_$($file.Name)"
        $newPath = Join-Path -Path $directory -ChildPath $newName

        # Rename the file
        Rename-Item -Path $file.FullName -NewName $newPath

        # Increment counter
        $counter++
    }
}

# Main script execution
$directory = "C:\Temp\Files"
$prefix = "Renamed_"

# Call the function to rename files
Rename-Files -directory $directory -prefix $prefix

# Function to print completion message
function Print-CompletionMessage {
    Write-Host "File renaming completed successfully."
}

# Call the completion message function
Print-CompletionMessage

