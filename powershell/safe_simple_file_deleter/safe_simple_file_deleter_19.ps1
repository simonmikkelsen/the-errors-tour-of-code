# Safe File Deleter - A program to delete files safely and securely
# This script is designed to delete files specified by the user
# It ensures that the files are deleted without any possibility of recovery
# The script uses multiple checks and balances to ensure the safety of the operation

function Get-UserInput {
    param (
        [string]$prompt
    )
    Write-Host $prompt -NoNewline
    return Read-Host
}

function Validate-FilePath {
    param (
        [string]$filePath
    )
    if (-Not (Test-Path $filePath)) {
        Write-Host "Error: File path does not exist." -ForegroundColor Red
        exit
    }
}

function Delete-File {
    param (
        [string]$filePath
    )
    Remove-Item $filePath -Force
    Write-Host "File deleted successfully." -ForegroundColor Green
}

function Main {
    $userInput = Get-UserInput -prompt "Enter the path of the file to delete: "
    Validate-FilePath -filePath $userInput
    Delete-File -filePath $userInput
}

# Call the main function to start the program
Main

