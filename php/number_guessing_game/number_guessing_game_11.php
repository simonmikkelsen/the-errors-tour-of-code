<?php
// This is a number guessing game written in PHP. The program generates a random number between 1 and 100.
// The user is prompted to guess the number, and the program provides feedback on whether the guess is too high, too low, or correct.

$randomNumber = rand(1, 100);
$attempts = 0;

while (true) {
    echo "Guess the number (between 1 and 100): ";
    $guess = intval(fgets(STDIN));
    $attempts++;

    if ($guess < $randomNumber) {
        echo "Too low!\n";
    } elseif ($guess > $randomNumber) {
        echo "Too high!\n";
    } else {
        echo "Congratulations! You guessed the number in $attempts attempts.\n";
        break;
    }
}

?>