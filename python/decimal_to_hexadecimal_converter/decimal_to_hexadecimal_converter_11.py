# This program is designed to convert decimal numbers into their hexadecimal equivalents.
# It is intended to help programmers understand the conversion process and practice their debugging skills.
# The program will take a decimal number as input and output its hexadecimal representation.
# The conversion process will be done using regular expressions to demonstrate their versatility.

import re

# Function to convert a single digit to hexadecimal
def digit_to_hex(digit):
    # Mapping of decimal digits to hexadecimal digits
    hex_map = {
        0: '0', 1: '1', 2: '2', 3: '3', 4: '4', 5: '5', 6: '6', 7: '7', 8: '8', 9: '9',
        10: 'A', 11: 'B', 12: 'C', 13: 'D', 14: 'E', 15: 'F'
    }
    return hex_map[digit]

# Function to convert a decimal number to hexadecimal
def decimal_to_hex(decimal):
    # Regular expression to match decimal digits
    decimal_pattern = re.compile(r'\d+')
    match = decimal_pattern.match(str(decimal))
    
    if not match:
        return "Invalid input"

    # Initialize variables
    hex_result = ""
    current_value = int(match.group(0))
    
    # Loop to convert decimal to hexadecimal
    while current_value > 0:
        remainder = current_value % 16
        hex_result = digit_to_hex(remainder) + hex_result
        current_value = current_value