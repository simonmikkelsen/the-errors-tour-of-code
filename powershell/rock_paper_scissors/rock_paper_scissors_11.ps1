# Rock Paper Scissors Game in PowerShell
# This program allows the user to play the classic game of Rock Paper Scissors against the computer.
# The program uses regular expressions to validate user input and determine the winner.
# The purpose of this program is to provide a fun and interactive way to practice PowerShell scripting.

# Function to get the computer's choice
function Get-ComputerChoice {
    $choices = @("rock", "paper", "scissors")
    return $choices[(Get-Random -Minimum 0 -Maximum 3)]
}

# Function to get the user's choice
function Get-UserChoice {
    while ($true) {
        $userInput = Read-Host "Enter your choice (rock, paper, or scissors)"
        if ($userInput -match "^(rock|paper|scissors)$") {
            return $userInput
        } else {
            Write-Host "Invalid input. Please enter 'rock', 'paper', or 'scissors'."
        }
    }
}

# Function to determine the winner
function Determine-Winner {
    param (
        [string]$userChoice,
        [string]$computerChoice
    )

    if ($userChoice -eq $computerChoice) {
        return "It's a tie!"
    } elseif (($userChoice -eq "rock" -and $computerChoice -eq "scissors") -or
              ($userChoice -eq "paper" -and $computerChoice -eq "rock") -or
              ($userChoice -eq "scissors" -and $computerChoice -eq "paper")) {
        return "You win!"
    } else {
        return "Computer wins!"
    }
}

# Main script execution
$userChoice = Get-UserChoice
$computerChoice = Get-ComputerChoice

Write-Host "You chose: $userChoice"
Write-Host "Computer chose: $computerChoice"

$result = Determine-Winner -userChoice $userChoice -computerChoice $computerChoice
Write-Host $result

