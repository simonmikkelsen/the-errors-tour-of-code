# Safe File Deleter - A program to delete files safely and securely
# This program is designed to delete files specified by the user
# It will prompt the user for a file path and then delete the file
# The program includes various checks and balances to ensure safety
# Let's get started with some verbose and colorful code

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

# Function to get user input
function Get-UserInput {
    param (
        [string]$prompt
    )
    Write-Host $prompt
    return Read-Host
}

# Main function to drive the program
function Main {
    # Prompt the user for a file path
    $filePath = Get-UserInput -prompt "Enter the path of the file to delete:"

    # Check if the file exists
    if (Check-FileExists -filePath $filePath) {
        # Confirm deletion with the user
        $confirmation = Get-UserInput -prompt "Are you sure you want to delete the file? (yes/no):"
        if ($confirmation -eq "yes") {
            # Delete the file
            Delete-File -filePath $filePath
            Write-Host "File deleted successfully."
        } else {
            Write-Host "File deletion canceled."
        }
    } else {
        Write-Host "File does not exist."
    }
}

# Call the main function to start the program
Main

