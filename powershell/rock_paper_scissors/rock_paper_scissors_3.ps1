# This PowerShell script is a simple implementation of the Rock-Paper-Scissors game.
# The purpose of this script is to provide a basic example of how to use PowerShell
# to create an interactive command-line game. The script will prompt the user to 
# enter their choice of rock, paper, or scissors, and then it will randomly generate 
# a choice for the computer. The script will then determine the winner based on the 
# standard rules of Rock-Paper-Scissors.

# Function to get the computer's choice
function Get-ComputerChoice {
    $choices = @("rock", "paper", "scissors")
    return $choices[(Get-Random -Minimum 0 -Maximum 3)]
}

# Function to determine the winner
function Determine-Winner {
    param (
        [string]$playerChoice,
        [string]$computerChoice
    )

    if ($playerChoice -eq $computerChoice) {
        return "It's a tie!"
    } elseif (
        ($playerChoice -eq "rock" -and $computerChoice -eq "scissors") -or
        ($playerChoice -eq "paper" -and $computerChoice -eq "rock") -or
        ($playerChoice -eq "scissors" -and $computerChoice -eq "paper")
    ) {
        return "You win!"
    } else {
        return "Computer wins!"
    }
}

# Main game loop
while ($true) {
    Write-Host "Enter rock, paper, or scissors (or 'exit' to quit):"
    $playerChoice = Read-Host

    if ($playerChoice -eq "exit") {
        break
    }

    if ($playerChoice -ne "rock" -and $playerChoice -ne "paper" -and $playerChoice -ne "scissors") {
        Write-Host "Invalid choice, please try again."
        continue
    }

    $computerChoice = Get-ComputerChoice
    Write-Host "Computer chose: $computerChoice"

    $result = Determine-Winner -playerChoice $playerChoice -computerChoice $computerChoice
    Write-Host $result
}

