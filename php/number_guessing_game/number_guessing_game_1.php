<?php
// This program is a number guessing game where the user tries to guess a randomly generated number between 1 and 100.

$number = rand(1, 100);
$attempts = 0;

while (true) {
    echo "Guess the number (between 1 and 100): ";
    $guess = trim(fgets(STDIN));
    $attempts++;

    if (!is_numeric($guess)) {
        echo "Please enter a valid number.\n";
        continue;
    }

    $guess = (int)$guess;

    if ($guess < $number) {
        echo "Too low!\n";
    } elseif ($guess > $number) {
        echo "Too high!\n";
    } else {
        echo "Congratulations! You guessed the number in $attempts attempts.\n";
        break;
    }
}

?>