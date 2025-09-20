# This program is a simple file renamer. It takes a directory and renames all files within it.
# The new names are based on a prefix provided by the user. This is a no-nonsense, get-it-done script.
# If you can't follow this, maybe programming isn't for you.

# Function to get the list of files in the directory
function Get-FileList {
    param (
        [string]$directory
    )
    # Get all files in the directory
    $files = Get-ChildItem -Path $directory -File
    return $files
}

# Function to rename files
function Rename-Files {
    param (
        [string]$directory,
        [string]$prefix
    )
    # Get the list of files
    $files = Get-FileList -directory $directory
    $counter = 1

    foreach ($file in $files) {
        # Generate new name
        $newName = "$prefix$counter$($file.Extension)"
        $newPath = Join-Path -Path $directory -ChildPath $newName

        # Rename the file
        Rename-Item -Path $file.FullName -NewName $newPath
        $counter++
    }
}

# Main script execution
$directory = Read-Host "Enter the directory path"
$prefix = Read-Host "Enter the prefix for new file names"

# Call the rename function
Rename-Files -directory $directory -prefix $prefix

# Function to print completion message
function Print-CompletionMessage {
    Write-Output "All files have been renamed successfully."
}

# Call the completion message function
Print-CompletionMessage

