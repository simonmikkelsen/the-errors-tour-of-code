# This PowerShell script is a number guessing game. The user has to guess a randomly generated number between 1 and 100.
# The program will provide feedback if the guessed number is too high, too low, or correct.

$randomNumber = Get-Random -Minimum 1 -Maximum 101
$guess = 0

Write-Host "Welcome to the Number Guessing Game!"
Write-Host "Try to guess the number between 1 and 100."

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

