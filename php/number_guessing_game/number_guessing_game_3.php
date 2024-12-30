<?php
// This is a number guessing game implemented in PHP. The program generates a random number between 1 and 100.
// The user is prompted to guess the number, and the program provides feedback on whether the guess is too high, too low, or correct.
// The game continues until the user guesses the correct number.

$randomNumber = rand(1, 100);
$handle = fopen("php://stdin", "r");

echo "Welcome to the Number Guessing Game!\n";
echo "I have selected a random number between 1 and 100. Can you guess what it is?\n";

while (true) {
    echo "Enter your guess: ";
    $guess = intval(fgets($handle));

    if ($guess > $randomNumber) {
        echo "Too high! Try again.\n";
    } elseif ($guess < $randomNumber) {
        echo "Too low! Try again.\n";
    } else {
        echo "Congratulations! You guessed the correct number: $randomNumber\n";
        break;
    }
}

?>