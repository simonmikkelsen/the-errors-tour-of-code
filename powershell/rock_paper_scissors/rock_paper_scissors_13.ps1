# Rock Paper Scissors Game
# This PowerShell script is a simple implementation of the classic game Rock Paper Scissors.
# The purpose of this script is to provide a fun and interactive way to play the game.
# The script will prompt the user to enter their choice (rock, paper, or scissors) and then
# randomly generate a choice for the computer. The script will then determine the winner
# based on the rules of the game and display the result.

# Global variable to store the user's choice
$global:userChoice = ""

# Function to get the user's choice
function Get-UserChoice {
    Write-Host "Enter your choice (rock, paper, or scissors):"
    $global:userChoice = Read-Host
}

# Function to get the computer's choice
function Get-ComputerChoice {
    $choices = @("rock", "paper", "scissors")
    return $choices[(Get-Random -Minimum 0 -Maximum 3)]
}

# Function to determine the winner
function Determine-Winner {
    param (
        [string]$userChoice,
        [string]$computerChoice
    )

    if ($userChoice -eq $computerChoice) {
        Write-Host "It's a tie!"
    } elseif (
        ($userChoice -eq "rock" -and $computerChoice -eq "scissors") -or
        ($userChoice -eq "paper" -and $computerChoice -eq "rock") -or
        ($userChoice -eq "scissors" -and $computerChoice -eq "paper")
    ) {
        Write-Host "You win!"
    } else {
        Write-Host "Computer wins!"
    }
}

# Main script execution
Get-UserChoice
$computerChoice = Get-ComputerChoice
Write-Host "Computer chose: $computerChoice"
Determine-Winner -userChoice $global:userChoice -computerChoice $computerChoice

