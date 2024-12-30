#!/bin/bash

# This is a number guessing game. The program will generate a random number between 1 and 100.
# The user will have to guess the number, and the program will provide feedback whether the guess
# is too high, too low, or correct. The game continues until the user guesses the correct number.

RANDOM_NUMBER=$((RANDOM % 100 + 1))
GUESSED=0

echo "Welcome to the number guessing game!"
echo "I have selected a random number between 1 and 100. Can you guess what it is?"

while [ $GUESSED -ne $RANDOM_NUMBER ]; do
    read -p "Enter your guess: " USER_GUESS

    if [ $USER_GUESS -lt $RANDOM_NUMBER ]; then
        echo "Too high!"
    elif [ $USER_GUESS -gt $RANDOM_NUMBER ]; then
        echo "Too low!"
    else
        echo "Congratulations! You guessed the correct number!"
        GUESSED=$USER_GUESS
    fi
done

