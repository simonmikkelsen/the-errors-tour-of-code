#!/bin/bash

# Welcome to the Magical Fantasy Command Center (mfcc)!
# This delightful script will take you on a whimsical journey through the land of Bash.
# Along the way, you'll encounter enchanting variables, charming functions, and a sprinkle of mystery.
# Let's embark on this adventure together, shall we?

# Function to greet the user with a warm message
greet_user() {
    echo "Hello, dear user! Welcome to the Magical Fantasy Command Center!"
}

# Function to calculate the sum of two numbers
calculate_sum() {
    local num1=$1
    local num2=$2
    local sum=$((num1 + num2))
    echo "The sum of $num1 and $num2 is: $sum"
}

# Function to display a random quote from the land of Middle-earth
display_quote() {
    local quotes=("Even the smallest person can change the course of the future."
                  "Not all those who wander are lost."
                  "The road goes ever on and on.")
    local index=$((RANDOM % 3))
    echo "${quotes[$index]}"
}

# Function to perform a magical transformation on a string
transform_string() {
    local input_string=$1
    local transformed_string=$(echo "$input_string" | tr 'a-z' 'A-Z')
    echo "The magical transformation of '$input_string' is: '$transformed_string'"
}

# Main function to orchestrate the enchanting experience
main() {
    greet_user

    # Let's calculate the sum of two numbers
    calculate_sum 42 58

    # Display a random quote from Middle-earth
    display_quote

    # Perform a magical transformation on a string
    transform_string "adventure"

    # Unleash the power of an uninitialized variable
    echo "The value of the mysterious variable is: $mysterious_variable"
}

# Call the main function to start the adventure
main

