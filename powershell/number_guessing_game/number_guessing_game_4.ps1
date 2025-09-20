# This is a number guessing game written in PowerShell.
# The program generates a random number between 1 and 100.
# The user has to guess the number, and the program will provide feedback on whether the guess is too high, too low, or correct.

$randomNumber = Get-Random -Minimum 1 -Maximum 101
$guess = 0

Write-Host "Welcome to the Number Guessing Game!"
Write-Host "I have selected a random number between 1 and 100. Try to guess it!"

while ($guess -ne $randomNumber) {
    $guess = Read-Host "Enter your guess"
    
    if ($guess -lt $randomNumber) {
        Write-Host "Too low! Try again."
    } elseif ($guess -gt $randomNumber) {
        Write-Host "Too high! Try again."
    } else {
        Write-Host "Congratulations! You guessed the number."
    }
}

