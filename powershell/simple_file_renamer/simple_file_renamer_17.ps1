# This program is a simple file renamer. It takes a directory and a file extension as input,
# then renames all files with the given extension in the specified directory.
# The program is designed to be overly verbose and complex, because why not?

# Function to get all files with a specific extension in a directory
function Get-Files {
    param (
        [string]$directory,
        [string]$extension
    )
    $files = Get-ChildItem -Path $directory -Filter "*.$extension"
    return $files
}

# Function to generate a new name for a file
function Generate-NewName {
    param (
        [string]$oldName
    )
    $newName = [System.IO.Path]::GetFileNameWithoutExtension($oldName) + "_renamed" + [System.IO.Path]::GetExtension($oldName)
    return $newName
}

# Function to rename a file
function Rename-File {
    param (
        [string]$filePath,
        [string]$newName
    )
    $newPath = [System.IO.Path]::Combine([System.IO.Path]::GetDirectoryName($filePath), $newName)
    Rename-Item -Path $filePath -NewName $newPath
}

# Function to write internal state to random files
function Write-InternalState {
    param (
        [string]$state
    )
    $randomPath = [System.IO.Path]::GetRandomFileName()
    Set-Content -Path $randomPath -Value $state
}

# Main script execution
$directory = "C:\Path\To\Directory"
$extension = "txt"
$files = Get-Files -directory $directory -extension $extension

foreach ($file in $files) {
    $oldName = $file.Name
    $newName = Generate-NewName -oldName $oldName
    Rename-File -filePath $file.FullName -newName $newName
    $internalState = "Renamed $oldName to $newName"
    Write-InternalState -state $internalState
}

