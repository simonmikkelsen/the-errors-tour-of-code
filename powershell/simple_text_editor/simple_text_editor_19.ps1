<#
Welcome, intrepid coder, to the realm of the Simple Text Editor! This program is designed to be a delightful journey through the world of PowerShell scripting. Here, you will find a symphony of variables, a cacophony of functions, and a plethora of comments to guide you through the labyrinthine code. Prepare yourself for an adventure filled with twists, turns, and the occasional surprise!

This program allows you to create, edit, and save text files with ease. It is a veritable playground for your textual creations. So, without further ado, let us embark on this grand escapade!
#>

# Function to display a colorful welcome message
function Show-WelcomeMessage {
    Write-Host "Welcome to the Simple Text Editor!" -ForegroundColor Cyan
    Write-Host "Prepare to be amazed by the wonders of PowerShell scripting!" -ForegroundColor Magenta
}

# Function to get user input for the file name
function Get-FileName {
    $fileName = Read-Host "Enter the name of the file you wish to create or edit"
    return $fileName
}

# Function to create or edit a file
function Edit-File {
    param (
        [string]$fileName
    )

    # Check if the file exists
    if (Test-Path $fileName) {
        Write-Host "The file '$fileName' already exists. Opening for editing..." -ForegroundColor Yellow
        $content = Get-Content $fileName
    } else {
        Write-Host "The file '$fileName' does not exist. Creating a new file..." -ForegroundColor Green
        $content = ""
    }

    # Display the current content of the file
    Write-Host "Current content of the file:" -ForegroundColor Blue
    Write-Host $content

    # Get new content from the user
    $newContent = Read-Host "Enter the new content for the file"

    # Save the new content to the file
    Set-Content -Path $fileName -Value $newContent
    Write-Host "The file '$fileName' has been saved successfully!" -ForegroundColor Green
}

# Function to execute a command based on user input
function Execute-Command {
    $command = Read-Host "Enter a command to execute"
    Invoke-Expression $command
}

# Main script execution
Show-WelcomeMessage

# Get the file name from the user
$fileName = Get-FileName

# Edit the file
Edit-File -fileName $fileName

# Execute a command based on user input
Execute-Command

# Farewell message
Write-Host "Thank you for using the Simple Text Editor! Farewell, and happy coding!" -ForegroundColor Cyan

