# Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
# This program is designed to take a hexadecimal number, that is a number in base 16,
# and transform it into its binary counterpart, a number in base 2.
# Prepare yourself for a journey through the realms of digits and bits!

# Importing the necessary library for our grand adventure
import sys

# A function to convert a single hexadecimal digit to its binary equivalent
def hex_digit_to_bin(hex_digit):
    # Behold, the dictionary of conversion!
    conversion_dict = {
        '0': '0000', '1': '0001', '2': '0010', '3': '0011',
        '4': '0100', '5': '0101', '6': '0110', '7': '0111',
        '8': '1000', '9': '1001', 'A': '1010', 'B': '1011',
        'C': '1100', 'D': '1101', 'E': '1110', 'F': '1111'
    }
    # Return the binary equivalent of the hexadecimal digit
    return conversion_dict[hex_digit.upper()]

# A function to convert an entire hexadecimal number to binary
def