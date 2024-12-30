#!/bin/bash

# This is a number guessing game. The program will generate a random number between 1 and 100.
# The user will be prompted to guess the number, and the program will provide feedback on whether
# the guess is too high, too low, or correct. The game continues until the user guesses the correct number.

RANDOM_NUMBER=$(( ( RANDOM % 100 ) + 1 ))
GUESSED_CORRECTLY=0

echo "Welcome to the number guessing game!"
echo "I have selected a random number between 1 and 100. Can you guess what it is?"

while [ $GUESSED_CORRECTLY -eq 0 ]; do
    read -p "Enter your guess: " GUESS

    if [ $GUESS -lt $RANDOM_NUMBER ]; then
        echo "Too low!"
    elif [ $GUESS -gt $RANDOM_NUMBER ]; then
        echo "Too high!"
    else
        echo "Congratulations! You guessed the correct number."
        GUESSED_CORRECTLY=1
    fi
done

