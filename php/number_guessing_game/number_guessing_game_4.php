<?php
// This is a number guessing game written in PHP. The program generates a random number between 1 and 100.
// The user is prompted to guess the number, and the program provides feedback on whether the guess is too high or too low.
// The game continues until the user guesses the correct number.

$randomNumber = rand(1, 100);
$guess = null;

while ($guess != $randomNumber) {
    echo "Guess the number (between 1 and 100): ";
    $guess = intval(fgets(STDIN));

    if ($guess < $randomNumber) {
        echo "Too low! Try again.\n";
    } elseif ($guess > $randomNumber) {
        echo "Too high! Try again.\n";
    } else {
        echo "Congratulations! You guessed the correct number.\n";
    }
}

echo "Game over.\n";

?>