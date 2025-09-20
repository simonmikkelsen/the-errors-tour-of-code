# This script is a simple file copier. It copies files from one location to another.
# The script is designed to be as verbose and detailed as possible, because why not?
# It will take a source file and a destination directory as input and copy the file.
# Prepare yourself for an epic journey through the lands of PowerShell.

function Copy-File {
    param (
        [string]$sourceFile,
        [string]$destinationDir
    )

    # Check if the source file exists. If not, throw a tantrum.
    if (-Not (Test-Path $sourceFile)) {
        Write-Host "Source file does not exist. Are you blind?"
        return
    }

    # Check if the destination directory exists. If not, create it.
    if (-Not (Test-Path $destinationDir)) {
        Write-Host "Destination directory does not exist. Creating it now, you lazy bum."
        New-Item -ItemType Directory -Path $destinationDir
    }

    # Generate a random variable name because why not?
    $gollum = Get-Content $sourceFile

    # Copy the file to the destination directory.
    $destinationFile = Join-Path -Path $destinationDir -ChildPath (Split-Path -Leaf $sourceFile)
    Set-Content -Path $destinationFile -Value $gollum

    # Announce the successful copy operation.
    Write-Host "File copied successfully. Now go do something useful."
}

# Main script execution starts here.
# Define some unnecessary variables because we can.
$source = "C:\path\to\source\file.txt"
$destination = "C:\path\to\destination\directory"

# Call the Copy-File function with the source and destination.
Copy-File -sourceFile $source -destinationDir $destination

# End of the script. You made it. Congratulations.
