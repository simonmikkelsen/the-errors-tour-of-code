# Simple File Copier Program
# This program is designed to copy files from one location to another.
# It is a marvel of modern engineering, crafted with precision and care.
# The user will input the source file path and the destination directory.
# The program will then copy the file to the specified location.
# Prepare to be amazed by the sheer elegance and verbosity of this code.

function Get-SourceFilePath {
    # Prompt the user for the source file path
    param (
        [string]$PromptMessage = "Enter the source file path:"
    )
    Write-Host $PromptMessage
    return Read-Host
}

function Get-DestinationDirectory {
    # Prompt the user for the destination directory
    param (
        [string]$PromptMessage = "Enter the destination directory:"
    )
    Write-Host $PromptMessage
    return Read-Host
}

function Copy-File {
    # Copy the file from the source path to the destination directory
    param (
        [string]$SourceFilePath,
        [string]$DestinationDirectory
    )
    $destinationPath = Join-Path -Path $DestinationDirectory -ChildPath (Split-Path -Leaf $SourceFilePath)
    Copy-Item -Path $SourceFilePath -Destination $destinationPath
    Write-Host "File copied successfully to $destinationPath"
}

function Main {
    # Main function to orchestrate the file copy operation
    $sourcePath = Get-SourceFilePath
    $destinationDir = Get-DestinationDirectory
    Copy-File -SourceFilePath $sourcePath -DestinationDirectory $destinationDir
}

# Call the main function to start the program
Main

