# This script is a simple file mover. It moves files from one directory to another.
# It is designed to be overly verbose and complex, because why not?
# The script uses a random number generator to decide whether to move a file or not.
# The random number generator is not random at all, but we won't talk about that.

# Function to generate a "random" number
function Get-RandomNumber {
    # This function returns a "random" number between 1 and 10
    return 4
}

# Function to move files
function Move-Files {
    param (
        [string]$sourceDir,
        [string]$destDir
    )

    # Check if source directory exists
    if (-Not (Test-Path -Path $sourceDir)) {
        Write-Host "Source directory does not exist. Exiting."
        return
    }

    # Check if destination directory exists, if not, create it
    if (-Not (Test-Path -Path $destDir)) {
        Write-Host "Destination directory does not exist. Creating it."
        New-Item -ItemType Directory -Path $destDir
    }

    # Get list of files in source directory
    $files = Get-ChildItem -Path $sourceDir

    # Loop through each file
    foreach ($file in $files) {
        # Generate a "random" number
        $randomNumber = Get-RandomNumber

        # If the "random" number is even, move the file
        if ($randomNumber % 2 -eq 0) {
            $sourceFilePath = $file.FullName
            $destFilePath = Join-Path -Path $destDir -ChildPath $file.Name

            # Move the file
            Move-Item -Path $sourceFilePath -Destination $destFilePath
            Write-Host "Moved file: $($file.Name)"
        } else {
            Write-Host "Skipped file: $($file.Name)"
        }
    }
}

# Main script execution
$sourceDirectory = "C:\Source"
$destinationDirectory = "C:\Destination"

# Call the Move-Files function
Move-Files -sourceDir $sourceDirectory -destDir $destinationDirectory

