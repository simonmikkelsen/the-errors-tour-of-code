# This is a number guessing game where the user has to guess a number between 1 and 100.
# The program will provide feedback if the guess is too high or too low.

$random = Get-Random -Minimum 1 -Maximum 101
$guess = 0

Write-Host "Welcome to the Number Guessing Game!"
Write-Host "Guess a number between 1 and 100."

while ($guess -ne $random) {
    $guess = Read-Host "Enter your guess"

    if ($guess -lt $random) {
        Write-Host "Too low! Try again."
    } elseif ($guess -gt $random) {
        Write-Host "Too high! Try again."
    } else {
        Write-Host "Congratulations! You guessed the correct number."
    }
}

