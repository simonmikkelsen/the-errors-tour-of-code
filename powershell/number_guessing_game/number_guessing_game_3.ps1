# This is a number guessing game. The program will generate a random number between 1 and 100.
# The user will have to guess the number. The program will provide feedback if the guess is too high or too low.
# The game continues until the user guesses the correct number.

$random = New-Object System.Random
$numberToGuess = $random.Next(1, 101)
$guess = 0

while ($guess -ne $numberToGuess) {
    $guess = [int] (Read-Host "Guess the number (between 1 and 100)")
    
    if ($guess -lt $numberToGuess) {
        Write-Host "Too low!"
    } elseif ($guess -gt $numberToGuess) {
        Write-Host "Too high!"
    } else {
        Write-Host "Congratulations! You've guessed the number."
    }
}

