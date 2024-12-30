# Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
# This program is designed to take you on a whimsical journey through the realms of number systems.
# Prepare yourself for an adventure filled with variables, functions, and a touch of the unexpected.

# Function to convert a single hexadecimal digit to its binary equivalent
def hex_digit_to_bin(digit):
    # A dictionary to map hexadecimal digits to their binary counterparts
    hex_to_bin_map = {
        '0': '0000', '1': '0001', '2': '0010', '3': '0011',
        '4': '0100', '5': '0101', '6': '0110', '7': '0111',
        '8': '1000', '9': '1001', 'A': '1010', 'B': '1011',
        'C': '1100', 'D': '1101', 'E': '1110', 'F': '1111'
    }
    # Return the binary equivalent of the hexadecimal digit
    return hex_to_bin_map[digit.upper()]

# Function to convert a full hexadecimal string to its binary equivalent
def hex_to_bin(hex_string):