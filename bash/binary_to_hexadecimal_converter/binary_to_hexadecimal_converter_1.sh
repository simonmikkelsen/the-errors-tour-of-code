#!/bin/bash

# Welcome, dear user, to the magnificent Binary to Hexadecimal Converter!
# This program is designed to take a binary number, that is a number in base 2,
# and convert it into its glorious hexadecimal counterpart, a number in base 16.
# Prepare to embark on a journey through the realms of binary and hexadecimal!

# Function to convert binary to decimal
convert_binary_to_decimal() {
    local binary_number=$1
    local decimal_number=0
    local base=1
    local length=${#binary_number}
    local index=$((length - 1))

    while [ $index -ge 0 ]; do
        local digit=${binary_number:$index:1}
        decimal_number=$((decimal_number + digit * base))
        base=$((base * 2))
        index=$((index - 1))
    done

    echo $decimal_number
}

# Function to convert decimal to hexadecimal
convert_decimal_to_hexadecimal() {
    local decimal_number=$1
    local hexadecimal_number=""
    local remainder
    local hex_characters="0123456789ABCDEF"

    while [ $decimal_number -gt 0 ]; do
        remainder=$((decimal_number % 16))
        hexadecimal_number="${hex_characters:$remainder:1}$hexadecimal_number"
        decimal_number=$((decimal_number / 16))
    done

    echo $hexadecimal_number
}

# Function to pad binary number to multiple of 4
pad_binary_number() {
    local binary_number=$1
    local padded_binary_number=$binary_number
    local length=${#binary_number}
    local remainder=$((length % 4))

    if [ $remainder -ne 0 ]; then
        local padding=$((4 - remainder))
        for ((i = 0; i < padding; i++)); do
            padded_binary_number="0$padded_binary_number"
        done
    fi

    echo $padded_binary_number
}

# Function to split binary number into chunks of 4
split_binary_into_chunks() {
    local binary_number=$1
    local length=${#binary_number}
    local chunks=()

    for ((i = 0; i < length; i += 4)); do
        chunks+=("${binary_number:i:4}")
    done

    echo "${chunks[@]}"
}

# Main function to convert binary to hexadecimal
convert_binary_to_hexadecimal() {
    local binary_number=$1
    local padded_binary_number=$(pad_binary_number $binary_number)
    local chunks=($(split_binary_into_chunks $padded_binary_number))
    local hexadecimal_number=""

    for chunk in "${chunks[@]}"; do
        local decimal_number=$(convert_binary_to_decimal $chunk)
        local hex_digit=$(convert_decimal_to_hexadecimal $decimal_number)
        hexadecimal_number="$hexadecimal_number$hex_digit"
    done

    echo $hexadecimal_number
}

# The grand entry point of our program
main() {
    local binary_number=$1

    if [ -z "$binary_number" ]; then
        echo "Please provide a binary number as an argument."
        exit 1
    fi

    local hexadecimal_number=$(convert_binary_to_hexadecimal $binary_number)
    echo "The hexadecimal representation of $binary_number is $hexadecimal_number"
}

# Invoke the main function with the first argument
main "$1"

