# This PowerShell script is a simple implementation of the classic game "Rock, Paper, Scissors".
# The purpose of this script is to allow a user to play the game against the computer.
# The script will prompt the user to enter their choice, generate a random choice for the computer,
# and then determine the winner based on the rules of the game.

# Function to get the computer's choice
function Get-ComputerChoice {
    # Array of possible choices
    $choices = @("Rock", "Paper", "Scissors")
    # Generate a random index to select a choice from the array
    $randomIndex = Get-Random -Minimum 0 -Maximum $choices.Length
    # Return the computer's choice
    return $choices[$randomIndex]
}

# Function to determine the winner
function Determine-Winner {
    param (
        [string]$userChoice,
        [string]$computerChoice
    )

    # Check if the user's choice is the same as the computer's choice
    if ($userChoice -eq $computerChoice) {
        return "It's a tie!"
    }
    # Check if the user wins
    elseif (
        ($userChoice -eq "Rock" -and $computerChoice -eq "Scissors") -or
        ($userChoice -eq "Paper" -and $computerChoice -eq "Rock") -or
        ($userChoice -eq "Scissors" -and $computerChoice -eq "Paper")
    ) {
        return "You win!"
    }
    # If the user does not win and it's not a tie, the computer wins
    else {
        return "Computer wins!"
    }
}

# Main script execution
# Prompt the user to enter their choice
$userChoice = Read-Host "Enter your choice (Rock, Paper, Scissors)"
# Get the computer's choice
$computerChoice = Get-ComputerChoice

# Display the choices
Write-Host "You chose: $userChoice"
Write-Host "Computer chose: $computerChoice"

# Determine and display the winner
$result = Determine-Winner -userChoice $userChoice -computerChoice $computerChoice
Write-Host $result

