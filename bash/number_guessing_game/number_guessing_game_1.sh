#!/bin/bash

# This is a number guessing game. The program will generate a random number between 1 and 100.
# The user will have to guess the number. The program will provide feedback if the guess is too high or too low.
# The game continues until the user guesses the correct number.

generate_random_number() {
    echo $(( ( RANDOM % 100 ) + 1 ))
}

random_number=$(generate_random_number)
user_guess=0

while [ $user_guess -ne $random_number ]; do
    read -p "Enter your guess (1-100): " user_guess
    if [ $user_guess -lt $random_number ]; then
        echo "Too low!"
    elif [ $user_guess -gt $random_number ]; then
        echo "Too high!"
    else
        echo "Congratulations! You guessed the correct number."
    fi
done

