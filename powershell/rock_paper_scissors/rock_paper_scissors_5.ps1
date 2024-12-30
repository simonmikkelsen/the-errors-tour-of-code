# This PowerShell script is a simple implementation of the classic game "Rock, Paper, Scissors".
# The purpose of this script is to provide a basic example of how to implement game logic in PowerShell.
# The script will prompt the user to enter their choice (rock, paper, or scissors) and then randomly generate a choice for the computer.
# The script will then determine the winner based on the rules of the game and display the result.

# Function to get the computer's choice
function Get-ComputerChoice {
    # Array of possible choices
    $choices = @("rock", "paper", "scissors")
    # Generate a random index to select a choice from the array
    $index = Get-Random -Minimum 0 -Maximum 3
    return $choices[$index]
}

# Function to determine the winner
function Determine-Winner {
    param (
        [string]$userChoice,
        [string]$computerChoice
    )

    # Display the choices
    Write-Host "You chose: $userChoice"
    Write-Host "Computer chose: $computerChoice"

    # Determine the winner based on the rules of the game
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
Write-Host "Welcome to Rock, Paper, Scissors!"
$userChoice = Read-Host "Please enter your choice (rock, paper, or scissors)"
$computerChoice = Get-ComputerChoice

# Call the function to determine the winner
Determine-Winner -userChoice $userChoice -computerChoice $computerChoice

# End of script
