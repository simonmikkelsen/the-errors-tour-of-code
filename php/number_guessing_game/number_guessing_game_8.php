<?php
// This is a number guessing game where the user has to guess a randomly generated number between 1 and 100.
// The program will provide feedback whether the guess is too high, too low, or correct.

$numberToGuess = rand(1, 100);
$attempts = 0;

while (true) {
    echo "Enter your guess (between 1 and 100): ";
    $guess = trim(fgets(STDIN));
    
    $attempts++;
    
    if ($guess < $numberToGuess) {
        echo "Too low!\n";
    } elseif ($guess > $numberToGuess) {
        echo "Too high!\n";
    } else {
        echo "Congratulations! You guessed the number in $attempts attempts.\n";
        break;
    }
}

echo "Game Over!\n";

?>