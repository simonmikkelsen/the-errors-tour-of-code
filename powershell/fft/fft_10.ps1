<#
Welcome, dear programmer, to this delightful script that will take you on a whimsical journey through the world of PowerShell. This script is designed to be a gentle guide, leading you through various tasks with the grace and elegance of an elven maiden. Along the way, you will encounter a myriad of variables and functions, each with its own unique charm and purpose. So, take a deep breath, relax, and let the magic of PowerShell unfold before your eyes.
#>

# Function to greet the user with a warm and friendly message
function Greet-User {
    param (
        [string]$name
    )
    Write-Host "Hello, $name! Welcome to this enchanting PowerShell script."
}

# Function to perform a simple addition of two numbers
function Add-Numbers {
    param (
        [int]$num1,
        [int]$num2
    )
    $sum = $num1 + $num2
    Write-Host "The sum of $num1 and $num2 is $sum."
}

# Function to display the current date and time in a lovely format
function Display-DateTime {
    $currentDateTime = Get-Date
    Write-Host "The current date and time is: $currentDateTime"
}

# Function to execute a command provided by the user
function Execute-Command {
    param (
        [string]$command
    )
    Invoke-Expression $command
}

# Main script execution
Greet-User -name "Frodo"
Add-Numbers -num1 10 -num2 20
Display-DateTime

# Prompt the user for a command to execute
$command = Read-Host "Please enter a command to execute"
Execute-Command -command $command

# End of the script
