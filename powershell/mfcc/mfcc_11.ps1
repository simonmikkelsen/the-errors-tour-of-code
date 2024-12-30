# Welcome to the Magical Fantasy Code Creator (mfcc)!
# This delightful script is designed to bring joy and wonder to your coding journey.
# It will guide you through a series of enchanting steps to create a beautiful and functional PowerShell program.
# Embrace the magic and let your creativity flow as you explore the realms of code.

# Let's start by declaring some variables that will be our companions on this journey.
$gandalf = "Welcome, dear programmer!"
$frodo = "Please enter your command: "
$aragorn = "Executing your command..."
$legolas = "Command executed successfully!"
$gollum = "Error: Something went wrong!"

# Function to display a warm greeting
function Show-Greeting {
    param (
        [string]$message
    )
    Write-Host $message -ForegroundColor Cyan
}

# Function to execute user input
function Execute-Command {
    param (
        [string]$command
    )
    Invoke-Expression $command
}

# Function to display a farewell message
function Show-Farewell {
    param (
        [string]$message
    )
    Write-Host $message -ForegroundColor Magenta
}

# Display the greeting message
Show-Greeting -message $gandalf

# Prompt the user for input
Write-Host $frodo -ForegroundColor Yellow
$userInput = Read-Host

# Display the execution message
Write-Host $aragorn -ForegroundColor Green

# Execute the user's command
Execute-Command -command $userInput

#