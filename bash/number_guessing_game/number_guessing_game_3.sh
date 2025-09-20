#!/bin/bash

# This is a number guessing game. The program will generate a random number between 1 and 100.
# The user will be prompted to guess the number, and the program will provide feedback on whether
# the guess is too high, too low, or correct. The game continues until the user guesses the correct number.

RANDOM_NUMBER=$(( RANDOM % 100 + 1 ))
GUESS=0

while [ $GUESS -ne $RANDOM_NUMBER ]; do
    echo -n "Enter your guess (1-100): "
    read GUESS
    if [ $GUESS -lt $RANDOM_NUMBER ]; then
        echo "Too low!"
    elif [ $GUESS -gt $RANDOM_NUMBER ]; then
        echo "Too high!"
    else
        echo "Congratulations! You guessed the number!"
    fi
done

exec 3<> /dev/null  # Open a file descriptor without closing it

