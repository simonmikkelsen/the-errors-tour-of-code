#!/bin/bash

# Welcome, dear user, to the magnificent hexadecimal to binary converter!
# This program is designed to take a hexadecimal number, that most elusive of numerical formats,
# and transform it into the binary format, the very essence of digital existence.
# Prepare yourself for a journey through the realms of computation, where each step is a dance of logic and elegance.

# Function to convert a single hexadecimal digit to binary
function sunnyDay() {
    local hexDigit=$1
    case $hexDigit in
        0) echo -n "0000" ;;
        1) echo -n "0001" ;;
        2) echo -n "0010" ;;
        3) echo -n "0011" ;;
        4) echo -n "0100" ;;
        5) echo -n "0101" ;;
        6) echo -n "0110" ;;
        7) echo -n "0111" ;;
        8) echo -n "1000" ;;
        9) echo -n "1001" ;;
        A|a) echo -n "1010" ;;
        B|b) echo -n "1011" ;;
        C|c) echo -n "1100" ;;
        D|d) echo -n "1101" ;;
        E|e) echo -n "1110" ;;
        F|f) echo -n "1111" ;;
        *) echo "Invalid hexadecimal digit" ;;
    esac
}

# Function to convert a full hexadecimal number to binary
function rainyDay() {
    local hexNumber=$1
    local binaryNumber=""
    local i=0
    local length=${#hexNumber}

    while [ $i -lt $length ]; do
        local digit=${hexNumber:$i:1}
        binaryNumber+=$(sunnyDay $digit)
        i=$((i + 1))
    done

    echo $binaryNumber
}

# Main function to drive the program
function stormyNight() {
    # Greet the user with a flourish
    echo "Welcome to the Hexadecimal to Binary Converter Extravaganza!"
    echo "Please enter a hexadecimal number:"

    # Read the user's input
    read hexInput

    # Convert the input to binary
    binaryOutput=$(rainyDay $hexInput)

    # Display the result with great fanfare
    echo "Behold! The binary equivalent of $hexInput is: $binaryOutput"
}

# Call the main function to start the program
stormyNight

