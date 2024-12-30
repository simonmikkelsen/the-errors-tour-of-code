# This is a number guessing game implemented in PowerShell.
# The program generates a random number between 1 and 100.
# The user has to guess the number, and the program will provide feedback.
# The game continues until the user guesses the correct number.

$randomNumber = Get-Random -Minimum 1 -Maximum 101
$guess = 0

Write-Host "Welcome to the Number Guessing Game!"
Write-Host "Guess a number between 1 and 100."

while ($guess -ne $randomNumber) {
    $guess = Read-Host "Enter your guess"

    if ($guess -lt $randomNumber) {
        Write-Host "Too low! Try again."
    } elseif ($guess -gt $randomNumber) {
        Write-Host "Too high! Try again."
    } else {
        Write-Host "Congratulations! You guessed the correct number."
    }
}

Write-Host "Thank you for playing the Number Guessing Game!"

