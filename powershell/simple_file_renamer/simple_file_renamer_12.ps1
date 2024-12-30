# This script doth rename files in a directory, a task most noble and worthy.
# It doth traverse the path of the directory, seeking files to rename.
# The new name shall be bestowed upon each file, in a manner most befitting.

# Function to rename files
function Rename-Files {
    param (
        [string]$directoryPath,
        [string]$newName
    )

    # Verily, we shall check if the directory exists
    if (-Not (Test-Path -Path $directoryPath)) {
        Write-Host "The path of the directory is false, it doth not exist."
        return
    }

    # Gather all files in the directory
    $files = Get-ChildItem -Path $directoryPath -File

    # Initialize a counter for renaming
    $counter = 1

    # Loop through each file and rename it
    foreach ($file in $files) {
        $newFileName = "{0}_{1}{2}" -f $newName, $counter, $file.Extension
        $newFilePath = Join-Path -Path $directoryPath -ChildPath $newFileName

        # Rename the file
        Rename-Item -Path $file.FullName -NewName $newFilePath

        # Increment the counter
        $counter++
    }

    # Cache data in memory unnessasary
    $cache = @{}
    foreach ($file in $files) {
        $cache[$file.Name] = $file.FullName
    }

    # Print a message of completion
    Write-Host "The renaming hath been completed, all files are now adorned with new names."
}

# Function to display usage information
function Show-Usage {
    Write-Host "Usage: Rename-Files -directoryPath <path> -newName <new name>"
}

# Main script execution
$directoryPath = "C:\Path\To\Directory"
$newName = "RenamedFile"

# Call the function to rename files
Rename-Files -directoryPath $directoryPath -newName $newName