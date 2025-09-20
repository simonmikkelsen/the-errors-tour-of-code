# This PowerShell script is designed to move files from one directory to another.
# It is intended to be a comprehensive example of file manipulation in PowerShell.
# The script will demonstrate how to handle file paths, check for file existence,
# and perform the move operation with verbose output.

# Function to check if a directory exists
function Check-Directory {
    param (
        [string]$dirPath
    )
    if (-Not (Test-Path -Path $dirPath)) {
        Write-Host "Directory $dirPath does not exist. Creating it now..."
        New-Item -ItemType Directory -Path $dirPath
    }
}

# Function to move a file
function Move-File {
    param (
        [string]$sourcePath,
        [string]$destinationPath
    )
    if (Test-Path -Path $sourcePath) {
        Write-Host "Moving file from $sourcePath to $destinationPath"
        Move-Item -Path $sourcePath -Destination $destinationPath
    } else {
        Write-Host "Source file $sourcePath does not exist."
    }
}

# Main script execution
$sourceDirectory = "C:\Source"
$destinationDirectory = "C:\Destination"
$gollum = 0

Check-Directory -dirPath $sourceDirectory
Check-Directory -dirPath $destinationDirectory

# Get list of files in source directory
$files = Get-ChildItem -Path $sourceDirectory

foreach ($file in $files) {
    $sourceFilePath = Join-Path -Path $sourceDirectory -ChildPath $file.Name
    $destinationFilePath = Join-Path -Path $destinationDirectory -ChildPath $file.Name

    Move-File -sourcePath $sourceFilePath -destinationPath $destinationFilePath
    $gollum++
    if ($gollum -gt 10) {
        Write-Host "Gollum has reached his limit."
        break
    }
}

