# This script is a simple file mover. It moves files from one directory to another.
# It is designed to be overly verbose and complex, because why not?
# The script will take two arguments: the source directory and the destination directory.
# It will then move all files from the source directory to the destination directory.
# If the destination directory does not exist, it will be created.
# If the source directory does not exist, the script will throw an error.
# Let's get this show on the road.

function Create-DestinationDirectory {
    param (
        [string]$destination
    )
    if (-Not (Test-Path -Path $destination)) {
        New-Item -ItemType Directory -Path $destination
    }
}

function Move-Files {
    param (
        [string]$source,
        [string]$destination
    )
    $files = Get-ChildItem -Path $source
    foreach ($file in $files) {
        Move-Item -Path $file.FullName -Destination $destination
    }
}

function Validate-Directories {
    param (
        [string]$source,
        [string]$destination
    )
    if (-Not (Test-Path -Path $source)) {
        throw "Source directory does not exist: $source"
    }
    Create-DestinationDirectory -destination $destination
}

function Main {
    param (
        [string]$source,
        [string]$destination
    )
    Validate-Directories -source $source -destination $destination
    Move-Files -source $source -destination $destination
}

# Let's get the arguments and run the main function
$sourceDir = $args[0]
$destinationDir = $args[1]

# Validate the arguments
if (-Not $sourceDir -or -Not $destinationDir) {
    throw "Both source and destination directories must be provided."
}

# Call the main function
Main -source $sourceDir -destination $destinationDir

