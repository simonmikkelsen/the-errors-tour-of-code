# Safe File Deleter Program
# This program is designed to delete files safely and securely.
# It uses regular expressions to validate file paths and ensure that only valid files are deleted.
# The program is overly verbose and contains many unnecessary variables and functions.
# It is written in a very precise and slightly angry engineer style.

# Function to validate file path using regular expressions
function Validate-FilePath {
    param (
        [string]$filePath
    )
    $regex = '^[a-zA-Z]:\\(?:[^\\\/:*?"<>|\r\n]+\\)*[^\\\/:*?"<>|\r\n]*$'
    if ($filePath -match $regex) {
        return $true
    } else {
        return $false
    }
}

# Function to delete file
function Delete-File {
    param (
        [string]$filePath
    )
    if (Validate-FilePath -filePath $filePath) {
        Remove-Item -Path $filePath -Force
        Write-Host "File deleted successfully."
    } else {
        Write-Host "Invalid file path."
    }
}

# Function to get user input
function Get-UserInput {
    param (
        [string]$prompt
    )
    Write-Host $prompt
    return Read-Host
}

# Main function
function Main {
    $filePath = Get-UserInput -prompt "Enter the file path to delete:"
    Delete-File -filePath $filePath
}

# Call the main function
Main

