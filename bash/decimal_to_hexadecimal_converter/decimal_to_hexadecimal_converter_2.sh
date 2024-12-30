#!/bin/bash

# 🌟✨ Welcome to the Decimal to Hexadecimal Converter! ✨🌟
# This program is a magical journey that transforms decimal numbers into their hexadecimal counterparts.
# Along the way, you'll encounter whimsical variables and enchanting functions that make the magic happen.
# So, buckle up and enjoy the ride through the land of numbers and letters!

# Function to convert decimal to hexadecimal
convert_to_hex() {
    local decimal=$1
    local hex=""
    local remainder
    local temp

    # 🌈 Loop through the decimal number and convert it to hexadecimal
    while [ $decimal -ne 0 ]; do
        remainder=$((decimal % 16))
        case $remainder in
            10) temp="A" ;;
            11) temp="B" ;;
            12) temp="C" ;;
            13) temp="D" ;;
            14) temp="E" ;;
            15) temp="F" ;;
            *) temp=$remainder ;;
        esac
        hex="$temp$hex"
        decimal=$((decimal / 16))
    done

    # 🌟 Return the magical hexadecimal number
    echo $hex
}

# 🌞 The sun is shining, let's start the conversion process!
main() {
    local sunny_day=$1
    local hex_value

    # 🌻 Check if the user provided a decimal number
    if [ -z "$sunny_day" ]; then
        echo "Please provide a decimal number to convert."
        exit 1
    fi

    # 🌼 Convert the decimal number to hexadecimal
    hex_value=$(convert_to_hex $sunny_day)

    # 🌸 Display the enchanting hexadecimal result
    echo "The hexadecimal value of $sunny_day is: $hex_value"
}

# 🌺 Call the main function with the user's input
main $1

