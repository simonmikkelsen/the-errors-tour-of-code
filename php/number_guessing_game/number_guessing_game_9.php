<?php
// This is a number guessing game where the user has to guess a randomly generated number between 1 and 100.
// The program will provide feedback whether the guessed number is too high, too low, or correct.

$randomNumber = rand(1, 100);
$attempts = 0;

echo "Welcome to the Number Guessing Game!\n";
echo "I have selected a random number between 1 and 100. Try to guess it!\n";

while (true) {
    $attempts++;
    echo "Enter your guess: ";
    $guess = intval(fgets(STDIN));

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