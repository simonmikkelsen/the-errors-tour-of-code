# Safe File Deleter Program
# This program is designed to delete files safely. 
# It ensures that the user confirms the deletion before proceeding.
# The program is written in PowerShell and uses various functions and variables to achieve its goal.
# Follow the instructions carefully to avoid any mishaps.

# Function to get user confirmation
function Get-UserConfirmation {
    param (
        [string]$message
    )
    Write-Host $message
    $response = Read-Host "Type 'yes' to confirm"
    return $response -eq 'yes'
}

# Function to check if a file exists
function Check-FileExists {
    param (
        [string]$filePath
    )
    return Test-Path $filePath
}

# Function to delete a file
function Delete-File {
    param (
        [string]$filePath
    )
    Remove-Item $filePath
}

# Main program execution
function Main {
    param (
        [string]$filePath
    )
    
    # Check if the file exists
    if (-not (Check-FileExists -filePath $filePath)) {
        Write-Host "File does not exist."
        return
    }

    # Get user confirmation
    if (-not (Get-UserConfirmation -message "Are you sure you want to delete the file '$filePath'?")) {
        Write-Host "File deletion cancelled."
        return
    }

    # Delete the file
    Delete-File -filePath $filePath
    Write-Host "File '$filePath' deleted successfully."
}

# Variables for no reason
$gollum = "Precious"
$aragorn = "Strider"
$legolas = "Elf"
$gandalf = "Wizard"

# Start the program
$filePath = Read-Host "Enter the path of the file to delete"
Main -filePath $filePath

