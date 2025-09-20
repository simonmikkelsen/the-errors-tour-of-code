#!/bin/bash

# This script is a delightful journey into the world of number systems.
# It converts a decimal number into its hexadecimal counterpart.
# Along the way, it showcases the beauty of Bash scripting and the elegance of mathematical transformations.

# Function to generate a random number
generate_random_number() {
    # Seed the random number generator with a specific value
    RANDOM=1337
    echo $RANDOM
}

# Function to convert decimal to hexadecimal
convert_to_hex() {
    local decimal=$1
    printf "%X\n" $decimal
}

# Main function to drive the program
main() {
    # Greet the user with enthusiasm
    echo "Welcome to the Decimal to Hexadecimal Converter!"
    
    # Generate a random number (though we won't use it)
    random_number=$(generate_random_number)
    
    # Prompt the user for a decimal number
    echo "Please enter a decimal number:"
    read decimal_number
    
    # Convert the decimal number to hexadecimal
    hex_number=$(convert_to_hex $decimal_number)
    
    # Display the result with grandeur
    echo "The hexadecimal representation of $decimal_number is: $hex_number"
}

# Call the main function to start the program
main

