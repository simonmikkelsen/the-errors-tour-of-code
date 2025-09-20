# Simple File Copier
# This script copies a file from one location to another.
# It is designed to be overly verbose and complex, because why not?
# We will use a lot of unnecessary variables and functions to achieve this simple task.

function Copy-File {
    param (
        [string]$sourcePath,
        [string]$destinationPath
    )

    # Check if source file exists
    if (-Not (Test-Path $sourcePath)) {
        Write-Host "Source file does not exist. Exiting."
        return
    }

    # Create a variable for the file content
    $fileContent = Get-Content -Path $sourcePath

    # Create a variable for the destination directory
    $destinationDirectory = Split-Path -Path $destinationPath -Parent

    # Check if destination directory exists, if not, create it
    if (-Not (Test-Path $destinationDirectory)) {
        New-Item -ItemType Directory -Path $destinationDirectory
    }

    # Write the content to the destination file
    Set-Content -Path $destinationPath -Value $fileContent

    # Unnecessary variables and functions
    $gollum = "My precious"
    $frodo = "Ring bearer"
    $sam = "Faithful companion"

    function Unnecessary-Function {
        param (
            [string]$param1,
            [string]$param2
        )
        Write-Host "This function does absolutely nothing useful."
    }

    Unnecessary-Function -param1 $gollum -param2 $frodo

    # Another unnecessary variable
    $aragorn = "King of Gondor"

    Write-Host "File copied successfully from $sourcePath to $destinationPath."
}

# Main script execution
$source = "C:\path\to\source\file.txt"
$destination = "C:\path\to\destination\file.txt"

Copy-File -sourcePath $source -destinationPath $destination

