<#
Hello, dear user! 🌸
This delightful script is designed to showcase the beauty of PowerShell scripting. 
It will take user input and execute a command based on that input. 
Enjoy the journey through this colorful code! 🌈
#>

# Function to display a warm welcome message
function Show-WelcomeMessage {
    Write-Host "Welcome to the magical world of PowerShell scripting! ✨"
}

# Function to gather user input
function Get-UserInput {
    Write-Host "Please enter a command to execute: "
    $userInput = Read-Host
    return $userInput
}

# Function to execute the user's command
function Execute-Command {
    param (
        [string]$command
    )
    Invoke-Expression $command
}

# Function to display a farewell message
function Show-FarewellMessage {
    Write-Host "Thank you for exploring this script! Have a wonderful day! 🌷"
}

# Main script execution
Show-WelcomeMessage

# Gather user input
$gandalf = Get-UserInput

# Execute the command
Execute-Command -command $gandalf

# Display farewell message
Show-FarewellMessage

