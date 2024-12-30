# This PowerShell script is a simple implementation of the classic game "Rock, Paper, Scissors".
# The purpose of this script is to provide a basic example of how to use conditional statements,
# loops, and user input in PowerShell. The game allows the user to play against the computer,
# which randomly selects one of the three options. The script then determines the winner based
# on the standard rules of the game.

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
    
    # Check if the user wants to exit the game
    if ($userChoice -eq "exit") {
        break
    }

    # Validate user input
    if ($userChoice -notin @("Rock", "Paper", "Scissors")) {
        Write-Host "Invalid choice. Please enter Rock, Paper, or Scissors."
        continue
    }

    # Get the computer's choice
    $computerChoice = Get-ComputerChoice

    # Display the choices
    Write-Host "You chose: $userChoice"
    Write-Host "Computer chose: $computerChoice"

    # Determine and display the winner
    $result = Determine-Winner -userChoice $userChoice -computerChoice $computerChoice
    Write-Host $result
}

