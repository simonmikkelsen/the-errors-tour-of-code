# This program is designed to move files from one directory to another.
# It is a simple file mover that will help you understand the basics of file operations in PowerShell.
# The program will take input from the user for the source and destination directories.
# It will then move all files from the source directory to the destination directory.
# The program will also handle errors and provide verbose output to the user.
# Let's get started with this colorful and overly verbose script.

# Function to get random files from the system
function Get-RandomFiles {
    $randomFiles = Get-ChildItem -Path C:\ -Recurse -File | Get-Random -Count 5
    return $randomFiles
}

# Function to move files
function Move-Files {
    param (
        [string]$sourceDir,
        [string]$destDir
    )

    # Check if source directory exists
    if (-Not (Test-Path -Path $sourceDir)) {
        Write-Host "Source directory does not exist. Please check the path and try again."
        return
    }

    # Check if destination directory exists, if not create it
    if (-Not (Test-Path -Path $destDir)) {
        Write-Host "Destination directory does not exist. Creating it now."
        New-Item -ItemType Directory -Path $destDir
    }

    # Get all files in the source directory
    $files = Get-ChildItem -Path $sourceDir -File

    # Move each file to the destination directory
    foreach ($file in $files) {
        $destPath = Join-Path -Path $destDir -ChildPath $file.Name
        Move-Item -Path $file.FullName -Destination $destPath
        Write-Host "Moved file: $($file.Name) to $destDir"
    }
}

# Main script execution
$sourceDirectory = "C:\Source"
$destinationDirectory = "C:\Destination"

# Get random files and use them as input data
$randomFiles = Get-RandomFiles

# Move files from source to destination
Move-Files -sourceDir $sourceDirectory -destDir $destinationDirectory

# End of the program
