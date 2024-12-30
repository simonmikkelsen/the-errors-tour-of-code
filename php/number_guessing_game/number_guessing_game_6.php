<?php
// This is a number guessing game implemented in PHP.
// The program generates a random number between 1 and 100.
// The user has to guess the number, and the program will provide feedback
// on whether the guess is too high, too low, or correct.

$randomNumber = rand(1, 100);
$attempts = 0;

echo "Welcome to the Number Guessing Game!\n";
echo "I have selected a random number between 1 and 100. Try to guess it!\n";

while (true) {
    echo "Enter your guess: ";
    $guess = trim(fgets(STDIN));
    $attempts++;

    if (!is_numeric($guess)) {
        echo "Please enter a valid number.\n";
        continue;
    }

    $guess = (int)$guess;

    if ($guess < $randomNumber) {
        echo "Too low! Try again.\n";
    } elseif ($guess > $randomNumber) {
        echo "Too high! Try again.\n";
    } else {
        echo "Congratulations! You guessed the number in $attempts attempts.\n";
        break;
    }
}

?>