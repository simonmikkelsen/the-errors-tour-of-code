# This PowerShell script is a simple implementation of the Rock-Paper-Scissors game.
# The purpose of this script is to allow users to play Rock-Paper-Scissors against the computer.
# The script will prompt the user to enter their choice, generate a random choice for the computer,
# and then determine the winner based on the standard rules of the game.

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

# Main script execution starts here
Write-Host "Welcome to Rock-Paper-Scissors!"
$userChoice = Read-Host "Enter your choice (Rock, Paper, Scissors)"

# Validate user input
if ($userChoice -ne "Rock" -and $userChoice -ne "Paper" -and $userChoice -ne "Scissors") {
    Write-Host "Invalid choice. Please enter Rock, Paper, or Scissors."
    exit
}

$computerChoice = Get-ComputerChoice
Write-Host "Computer chose: $computerChoice"

$result = Determine-Winner -userChoice $userChoice -computerChoice $computerChoice
Write-Host $result

# End of script
