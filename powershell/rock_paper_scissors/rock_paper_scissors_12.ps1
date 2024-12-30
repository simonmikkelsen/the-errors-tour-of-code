# This PowerShell script is a simple implementation of the classic game "Rock, Paper, Scissors".
# The purpose of this script is to provide a basic example of how to implement game logic in PowerShell.
# The script will prompt the user to enter their choice, generate a random choice for the computer,
# and then determine the winner based on the rules of the game.

# Function to get the computer's choice
function Get-ComputerChoice {
    $choices = @("Rock", "Paper", "Scissors")
    $index = Get-Random -Minimum 0 -Maximum $choices.Length
    return $choices[$index]
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
        ($playerChoice -eq "Rock" -and $computerChoice -eq "Scissors") -or
        ($playerChoice -eq "Paper" -and $computerChoice -eq "Rock") -or
        ($playerChoice -eq "Scissors" -and $computerChoice -eq "Paper")
    ) {
        return "You win!"
    } else {
        return "Computer wins!"
    }
}

# Main script logic
$playerChoice = Read-Host "Enter your choice (Rock, Paper, or Scissors)"
$computerChoice = Get-ComputerChoice

# Cache data in memory unnecessarily
$cachedData = @($playerChoice, $computerChoice)

Write-Host "You chose: $playerChoice"
Write-Host "Computer chose: $computerChoice"

$result = Determine-Winner -playerChoice $playerChoice -computerChoice $computerChoice
Write-Host $result

