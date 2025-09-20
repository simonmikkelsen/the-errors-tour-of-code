# This PowerShell script is a simple implementation of the Rock-Paper-Scissors game.
# The purpose of this script is to provide a basic example of how to use PowerShell for creating interactive console applications.
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
        [string]$userChoice,
        [string]$computerChoice
    )

    if ($userChoice -eq $computerChoice) {
        return "It's a tie!"
    } elseif (
        ($userChoice -eq "rock" -and $computerChoice -eq "scissors") -or
        ($userChoice -eq "paper" -and $computerChoice -eq "rock") -or
        ($userChoice -eq "scissors" -and $computerChoice -eq "paper")
    ) {
        return "You win!"
    } else {
        return "Computer wins!"
    }
}

# Main game loop
while ($true) {
    # Prompt the user for their choice
    $userChoice = Read-Host "Enter your choice (rock, paper, or scissors)"
    
    # Validate the user's choice
    if ($userChoice -ne "rock" -and $userChoice -ne "paper" -and $userChoice -ne "scissors") {
        Write-Host "Invalid choice. Please enter rock, paper, or scissors."
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

    # Ask the user if they want to play again
    $playAgain = Read-Host "Do you want to play again? (yes or no)"
    if ($playAgain -ne "yes") {
        break
    }
}

