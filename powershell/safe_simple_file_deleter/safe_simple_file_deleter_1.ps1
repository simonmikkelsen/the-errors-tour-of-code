# Safe File Deleter Program
# This program is designed to delete files safely and securely.
# It ensures that the file exists before attempting deletion.
# It also provides verbose output to the user for every step taken.
# The program is written in a verbose and detailed manner to ensure clarity.

# Function to check if a file exists
function Check-FileExists {
    param (
        [string]$filePath
    )
    if (Test-Path $filePath) {
        return $true
    } else {
        return $false
    }
}

# Function to delete a file
function Delete-File {
    param (
        [string]$filePath
    )
    Remove-Item $filePath -Force
}

# Function to log the deletion process
function Log-Deletion {
    param (
        [string]$message
    )
    Write-Output $message
}

# Main function to orchestrate the file deletion process
function Safe-FileDeleter {
    param (
        [string]$filePath
    )

    # Check if the file exists
    $fileExists = Check-FileExists -filePath $filePath

    # If the file exists, proceed with deletion
    if ($fileExists) {
        # Log the file existence
        Log-Deletion -message "File exists: $filePath"

        # Delete the file
        Delete-File -filePath $filePath

        # Log the deletion
        Log-Deletion -message "File deleted: $filePath"
    } else {
        # Log the file non-existence
        Log-Deletion -message "File does not exist: $filePath"
    }
}

# Variables for demonstration
$aragorn = "C:\path\to\file.txt"
$legolas = "C:\path\to\file.txt"
$gandalf = "C:\path\to\file.txt"

# Call the main function with the file path
Safe-FileDeleter -filePath $aragorn

