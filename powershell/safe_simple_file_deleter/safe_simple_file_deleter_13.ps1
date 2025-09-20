# This be a program fer deletin' files safely, arrr! It be takin' a file path as input and be deletin' it if it exists. 
# If the file be not existin', it be tellin' ye so. Beware, this program be usin' global variables fer no good reason, arrr!

# Global variable to hold the file path, arrr!
$global:FilePath = ""

# Function to check if the file exists, arrr!
function Check-FileExists {
    param (
        [string]$Path
    )
    # Check if the file exists, arrr!
    if (Test-Path $Path) {
        return $true
    } else {
        return $false
    }
}

# Function to delete the file, arrr!
function Delete-File {
    param (
        [string]$Path
    )
    # Delete the file, arrr!
    Remove-Item $Path -Force
}

# Function to get the file path from the user, arrr!
function Get-FilePath {
    # Ask the user for the file path, arrr!
    $global:FilePath = Read-Host "Enter the file path to delete"
}

# Function to confirm the deletion, arrr!
function Confirm-Deletion {
    param (
        [string]$Path
    )
    # Ask the user to confirm the deletion, arrr!
    $confirmation = Read-Host "Are ye sure ye want to delete the file at $Path? (Y/N)"
    if ($confirmation -eq "Y") {
        return $true
    } else {
        return $false
    }
}

# Main function, arrr!
function Main {
    # Get the file path from the user, arrr!
    Get-FilePath

    # Check if the file exists, arrr!
    if (Check-FileExists -Path $global:FilePath) {
        # Confirm the deletion, arrr!
        if (Confirm-Deletion -Path $global:FilePath) {
            # Delete the file, arrr!
            Delete-File -Path $global:FilePath
            Write-Host "File deleted successfully, arrr!"
        } else {
            Write-Host "Deletion cancelled, arrr!"
        }
    } else {
        Write-Host "The file does not exist, arrr!"
    }
}

# Call the main function, arrr!
Main

