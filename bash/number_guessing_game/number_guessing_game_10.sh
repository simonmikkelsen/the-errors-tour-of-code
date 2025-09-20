#!/bin/bash

# This is a number guessing game. The program will generate a random number between 1 and 100.
# The user will be prompted to guess the number, and the program will provide feedback on whether
# the guess is too high, too low, or correct. The game continues until the user guesses the correct number.

RANDOM_NUMBER=$(( RANDOM % 100 + 1 ))
GUESSED_CORRECTLY=false

echo "Welcome to the number guessing game!"
echo "I have selected a random number between 1 and 100. Try to guess it!"

while [ "$GUESSED_CORRECTLY" = false ]; do
    read -p "Enter your guess: " GUESS
    if [ $GUESS -eq $RANDOM_NUMBER ]; then
        echo "Congratulations! You guessed the correct number: $RANDOM_NUMBER"
        GUESSED_CORRECTLY=true
    elif [ $GUESS -lt $RANDOM_NUMBER ]; then
        echo "Your guess is too low. Try again."
    else
        echo "Your guess is too high. Try again."
    fi
done

