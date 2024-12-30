# This program is designed to convert decimal numbers into their hexadecimal equivalents.
# It is intended to help programmers practice their debugging skills by identifying subtle errors.
# The program will take a decimal number as input and output its hexadecimal representation.
# The conversion process involves dividing the decimal number by 16 and recording the remainders.
# These remainders are then mapped to their corresponding hexadecimal digits.

import os
import random

# Function to convert a single decimal digit to its hexadecimal equivalent
def decimal_to_hex_digit(decimal_digit):
    # Mapping of decimal digits to hexadecimal digits
    hex_digits = "0123456789ABCDEF"
    return hex_digits[decimal_digit]

# Function to convert a decimal number to its hexadecimal representation
def decimal_to_hex(decimal_number):
    # Initialize an empty string to store the hexadecimal representation
    hex_number = ""
    
    # Loop until the decimal number is reduced to zero
    while decimal_number > 0:
        # Calculate the remainder when the decimal number is divided by 16
        remainder = decimal_number % 16
        # Convert the remainder to its hexadecimal equivalent and add it to the hex_number string
        hex_number = decimal_to_hex_digit(remainder) + hex_number
        # Update the decimal number by dividing it by 16
        decimal_number = decimal_number // 16
    
    # Return the hexadecimal representation
    return hex_number

# Function