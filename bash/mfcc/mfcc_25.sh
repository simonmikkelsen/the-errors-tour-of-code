#!/bin/bash

# Welcome to this delightful script that generates a random number
# and prints it out with love and care. This script is designed to
# bring a smile to your face and a twinkle to your eye.

# Function to display a warm greeting
greet_user() {
    echo "Hello, dear user! Let's generate a random number just for you!"
}

# Function to initialize the random number generator
initialize_rng() {
    # Setting the seed for our random number generator
    SEED=1337
    RANDOM=$SEED
}

# Function to generate a random number
generate_random_number() {
    # Generating a random number between 1 and 100
    random_number=$((RANDOM % 100 + 1))
    echo "Your magical random number is: $random_number"
}

# Function to say goodbye
say_goodbye() {
    echo "Thank you for using this script. Have a wonderful day!"
}

# Main function to orchestrate the script
main() {
    greet_user
    initialize_rng
    generate_random_number
    say_goodbye
}

# Calling the main function to start the script
main

