# This PowerShell script is a simple implementation of the classic game "Rock, Paper, Scissors".
# The purpose of this script is to provide a basic example of how to implement game logic in PowerShell.
# The script will prompt the user to enter their choice (rock, paper, or scissors) and then randomly generate a choice for the computer.
# The script will then determine the winner based on the rules of the game and display the result.

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

# Main script execution
Write-Host "Welcome to Rock, Paper, Scissors!"
$playerChoice = Read-Host "Enter your choice (rock, paper, or scissors)"
$computerChoice = Get-ComputerChoice

Write-Host "You chose: $playerChoice"
Write-Host "Computer chose: $computerChoice"

$result = Determine-Winner -playerChoice $playerChoice -computerChoice $computerChoice
Write-Host $result

