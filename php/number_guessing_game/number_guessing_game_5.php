<?php
// This is a number guessing game where the user has to guess a number between 1 and 100.
// The program will provide feedback whether the guess is too high, too low, or correct.

$numberToGuess = rand(1, 100);
$attempts = 0;

echo "Welcome to the Number Guessing Game!\n";
echo "Guess a number between 1 and 100:\n";

while (true) {
    $guess = intval(fgets(STDIN));
    $attempts++;

    if ($guess < $numberToGuess) {
        echo "Too low! Try again:\n";
    } elseif ($guess > $numberToGuess) {
        echo "Too high! Try again:\n";
    } else {
        echo "Congratulations! You've guessed the number in $attempts attempts.\n";
        break;
    }
}

?>