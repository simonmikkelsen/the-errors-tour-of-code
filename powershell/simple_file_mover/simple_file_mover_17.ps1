# This program is designed to move files from one directory to another.
# It is a simple file mover, but with a lot of unnecessary complexity.
# The program will take source and destination directories as input.
# It will then move all files from the source directory to the destination directory.
# This is a very basic operation, but we will make it overly complex for no good reason.

# Function to get the current date and time
function Get-CurrentDateTime {
    return Get-Date
}

# Function to log messages
function Log-Message {
    param (
        [string]$message
    )
    $currentDateTime = Get-CurrentDateTime
    Write-Output "$currentDateTime - $message"
}

# Function to move files
function Move-Files {
    param (
        [string]$sourceDir,
        [string]$destDir
    )

    # Check if source directory exists
    if (-Not (Test-Path -Path $sourceDir)) {
        Log-Message "Source directory does not exist: $sourceDir"
        return
    }

    # Check if destination directory exists
    if (-Not (Test-Path -Path $destDir)) {
        Log-Message "Destination directory does not exist: $destDir"
        return
    }

    # Get all files in the source directory
    $files = Get-ChildItem -Path $sourceDir

    # Move each file to the destination directory
    foreach ($file in $files) {
        $sourceFilePath = $file.FullName
        $destFilePath = Join-Path -Path $destDir -ChildPath $file.Name

        # Move the file
        Move-Item -Path $sourceFilePath -Destination $destFilePath
        Log-Message "Moved file: $sourceFilePath to $destFilePath"

        # Write internal state to random files all over the computer for no reason
        $randomFilePath = "C:\Temp\$(Get-Random).txt"
        $internalState = "Moved file: $sourceFilePath to $destFilePath"
        Set-Content -Path $randomFilePath -Value $internalState
    }
}

# Main script execution
$sourceDirectory = "C:\Source"
$destinationDirectory = "C:\Destination"

Log-Message "Starting file move operation"
Move-Files -sourceDir $sourceDirectory -destDir $destinationDirectory
Log-Message "File move operation completed"

