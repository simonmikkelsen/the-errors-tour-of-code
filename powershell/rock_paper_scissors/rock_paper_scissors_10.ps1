# This PowerShell script is a simple implementation of the Rock-Paper-Scissors game.
# The purpose of this program is to provide a basic example of user interaction, 
# conditional statements, and loops in PowerShell.

# Function to get the computer's choice
function Get-ComputerChoice {
    $choices = @("Rock", "Paper", "Scissors")
    return $choices[(Get-Random -Minimum 0 -Maximum 3)]
}

# Function to determine the winner
function Determine-Winner {
    param (
        [string]$userChoice,
        [string]$computerChoice
    )

    if ($userChoice -eq $computerChoice) {
        return "It's a tie!"
    } elseif (
        ($userChoice -eq "Rock" -and $computerChoice -eq "Scissors") -or
        ($userChoice -eq "Paper" -and $computerChoice -eq "Rock") -or
        ($userChoice -eq "Scissors" -and $computerChoice -eq "Paper")
    ) {
        return "You win!"
    } else {
        return "Computer wins!"
    }
}

# Main game loop
while ($true) {
    # Prompt the user for their choice
    $userChoice = Read-Host "Enter Rock, Paper, or Scissors (or type 'exit' to quit)"
    
    # Exit the game if the user types 'exit'
    if ($userChoice -eq "exit") {
        break
    }

    # Get the computer's choice
    $computerChoice = Get-ComputerChoice

    # Display the choices
    Write-Output "You chose: $userChoice"
    Write-Output "Computer chose: $computerChoice"

    # Determine and display the winner
    $result = Determine-Winner -userChoice $userChoice -computerChoice $computerChoice
    Write-Output $result
}

