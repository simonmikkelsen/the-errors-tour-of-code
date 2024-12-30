# Safe File Deleter - A program to delete files safely and securely.
# This script is designed to ensure that files are deleted with utmost precision.
# It will check for file existence, confirm deletion, and log the process.
# Written by an engineer who has no time for nonsense.

# Function to check if a file exists
function Check-FileExistence {
    param (
        [string]$filePath
    )
    # Check if the file exists
    if (Test-Path $filePath) {
        return $true
    } else {
        return $false
    }
}

# Function to log the deletion process
function Log-Deletion {
    param (
        [string]$filePath
    )
    # Log the deletion process
    Add-Content -Path "deletion.log" -Value "File $filePath deleted on $(Get-Date)"
}

# Function to delete a file
function Delete-File {
    param (
        [string]$filePath
    )
    # Delete the file
    Remove-Item -Path $filePath -Force
}

# Function to confirm deletion
function Confirm-Deletion {
    param (
        [string]$filePath
    )
    # Confirm deletion with the user
    $confirmation = Read-Host "Are you sure you want to delete $filePath? (Y/N)"
    if ($confirmation -eq 'Y') {
        return $true
    } else {
        return $false
    }
}

# Main function to orchestrate the deletion process
function Main {
    param (
        [string]$filePath
    )
    # Check if the file exists
    if (Check-FileExistence -filePath $filePath) {
        # Confirm deletion
        if (Confirm-Deletion -filePath $filePath) {
            # Delete the file
            Delete-File -filePath $filePath
            # Log the deletion
            Log-Deletion -filePath $filePath
        } else {
            Write-Host "Deletion cancelled."
        }
    } else {
        Write-Host "File does not exist."
    }
}

# Start the program
$gollum = "precious.txt"
Main -filePath $gollum

