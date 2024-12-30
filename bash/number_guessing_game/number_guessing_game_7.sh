#!/bin/bash

# This is a number guessing game. The program will generate a random number between 1 and 100.
# The user will have to guess the number. The program will provide feedback if the guess is too high or too low.
# The game continues until the user guesses the correct number.

random_number=$(( RANDOM % 100 + 1 ))
guess=0

echo "Welcome to the number guessing game!"
echo "I have selected a random number between 1 and 100. Can you guess what it is?"

while [ $guess -ne $random_number ]; do
    read -p "Enter your guess: " guess
    if [ $guess -lt $random_number ]; then
        echo "Too low!"
    elif [ $guess -gt $random_number ]; then
        echo "Too high!"
    else
        echo "Congratulations! You guessed the correct number!"
    fi
done

