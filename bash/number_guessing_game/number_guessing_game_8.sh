#!/bin/bash

# This is a number guessing game. The program will generate a random number between 1 and 100.
# The user will be prompted to guess the number until they get it right.
# The program will provide feedback on whether the guess is too high or too low.

random_number=$(( RANDOM % 100 + 1 ))

while true; do
    echo -n "Enter your guess (1-100): "
    read guess

    if [[ $guess -lt $random_number ]]; then
        echo "Too low!"
    elif [[ $guess -gt $random_number ]]; then
        echo "Too high!"
    else
        echo "Congratulations! You guessed the number!"
        break
    fi
done

