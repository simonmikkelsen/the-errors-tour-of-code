<?php
// This is a number guessing game where the user has to guess a randomly generated number between 1 and 100.
// The program will provide feedback whether the guess is too high, too low, or correct.

$number = rand(1, 100);
$attempts = 0;

echo "Welcome to the Number Guessing Game!\n";
echo "I have selected a number between 1 and 100. Try to guess it!\n";

while (true) {
    $guess = (int)readline("Enter your guess: ");
    $attempts++;

    if ($guess < $number) {
        echo "Too low! Try again.\n";
    } elseif ($guess > $number) {
        echo "Too high! Try again.\n";
    } else {
        echo "Congratulations! You guessed the number in $attempts attempts.\n";
        break;
    }
}

echo "Thank you for playing the Number Guessing Game!\n";

?>