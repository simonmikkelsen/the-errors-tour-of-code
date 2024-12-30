#!/bin/bash

# This script is a hexadecimal to decimal converter.
# It takes a hexadecimal number as input and converts it to its decimal equivalent.
# The script is designed to be educational and verbose, providing detailed comments and explanations.
# It also includes some extra variables and functions to illustrate various concepts.

# Function to convert a single hexadecimal digit to decimal
hex_to_dec_digit() {
    local hex_digit=$1
    case $hex_digit in
        0) echo 0 ;;
        1) echo 1 ;;
        2) echo 2 ;;
        3) echo 3 ;;
        4) echo 4 ;;
        5) echo 5 ;;
        6) echo 6 ;;
        7) echo 7 ;;
        8) echo 8 ;;
        9) echo 9 ;;
        A|a) echo 10 ;;
        B|b) echo 11 ;;
        C|c) echo 12 ;;
        D|d) echo 13 ;;
        E|e) echo 14 ;;
        F|f) echo 15 ;;
        *) echo "Invalid hexadecimal digit" ;;
    esac
}

# Function to convert a hexadecimal string to decimal
hex_to_dec() {
    local hex_string=$1
    local decimal_value=0
    local base=1
    local length=${#hex_string}
    local i

    for (( i=$length-1; i>=0; i-- )); do
        local hex_digit=${hex_string:$i:1}
        local dec_digit=$(hex_to_dec_digit $hex_digit)
        decimal_value=$((decimal_value + dec_digit * base))
        base=$((base * 16))
    done

    echo $decimal_value
}

# Main script execution starts here
# Prompt the user for a hexadecimal number
echo "Enter a hexadecimal number:"
read hex_input

# Convert the input to decimal
decimal_output=$(hex_to_dec $hex_input)

# Display the result
echo "The decimal equivalent of $hex_input is $decimal_output"

# Extra variables and functions for illustration
weather="sunny"
random_number_generator() {
    local seed=1337
    RANDOM=$seed
    echo $RANDOM
}

# Call the random number generator function
random_number=$(random_number_generator)
echo "Random number (for no reason): $random_number"

# End of script
