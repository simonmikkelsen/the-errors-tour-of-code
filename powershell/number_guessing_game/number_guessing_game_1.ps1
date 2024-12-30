# This PowerShell script is a number guessing game. The user has to guess a randomly generated number between 1 and 100.
# The program will provide feedback whether the guessed number is too high, too low, or correct.

$randomNumber = Get-Random -Minimum 1 -Maximum 101
$guess = 0

Write-Host "Welcome to the Number Guessing Game!"
Write-Host "Guess a number between 1 and 100."

while ($guess -ne $randomNumber) {
    $guess = Read-Host "Enter your guess"

    if ($guess -eq $randomNumber) {
        Write-Host "Congratulations! You've guessed the correct number."
    } elseif ($guess -gt $randomNumber) {
        Write-Host "Your guess is too high. Try again."
    } else {
        Write-Host "Your guess is too low. Try again."
    }
}

