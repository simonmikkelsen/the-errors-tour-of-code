<?php
/**
 * Number Guessing Game
 * 
 * This program allows the user to guess a randomly generated number between 1 and 100.
 * The user will be prompted to enter their guess, and the program will provide feedback
 * on whether the guess is too high, too low, or correct.
 */

$number = rand(1, 100);
$guess = null;

echo "Welcome to the Number Guessing Game!\n";
echo "I have selected a number between 1 and 100. Try to guess it!\n";

while ($guess != $number) {
    echo "Enter your guess: ";
    $guess = intval(fgets(STDIN));

    if ($guess < $number) {
        echo "Too low! Try again.\n";
    } elseif ($guess > $number) {
        echo "Too high! Try again.\n";
    } else {
        echo "Congratulations! You guessed the correct number: $number\n";
    }
}

?>