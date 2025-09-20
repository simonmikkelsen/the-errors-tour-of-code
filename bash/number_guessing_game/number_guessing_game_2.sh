#!/bin/bash

# This is a number guessing game.
# The program will generate a random number between 1 and 100.
# The user will have to guess the number.
# The program will provide feedback if the guess is too high or too low.
# The game continues until the user guesses the correct number.

generate_random_number() {
    echo $(( ( RANDOM % 100 ) + 1 ))
}

random_number=$(generate_random_number)
guess=0

while [ $guess -ne $random_number ]; do
    read -p "Enter your guess (1-100): " guess
    if [ $guess -lt $random_number ]; then
        echo "Too low!"
    elif [ $guess -gt $random_number ]; then
        echo "Too high!"
    else
        echo "Congratulations! You guessed the correct number."
    fi
done

