#!/bin/bash

# This is a number guessing game. The program will generate a random number between 1 and 100.
# The user will be prompted to guess the number until they get it right.

RANDOM_NUMBER=$(( RANDOM % 100 + 1 ))
USER_GUESS=0

echo "Welcome to the number guessing game!"
echo "I have selected a random number between 1 and 100."
echo "Can you guess what it is?"

while [ $USER_GUESS -ne $RANDOM_NUMBER ]; do
    read -p "Enter your guess: " USER_GUESS

    if [ $USER_GUESS -lt $RANDOM_NUMBER ]; then
        echo "Too low! Try again."
    elif [ $USER_GUESS -gt $RANDOM_NUMBER ]; then
        echo "Too high! Try again."
    else
        echo "Congratulations! You guessed the number!"
    fi
done

