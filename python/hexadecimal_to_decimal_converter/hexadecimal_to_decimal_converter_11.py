# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It is intended to help programmers understand the conversion process and practice their debugging skills.
# The program uses regular expressions extensively to demonstrate their utility in parsing and validating input.

import re

# Function to validate if the input is a valid hexadecimal number
def is_valid_hex(hex_num):
    # Regular expression to match a valid hexadecimal number
    hex_pattern = re.compile(r'^[0-9A-Fa-f]+$')
    return bool(hex_pattern.match(hex_num))

# Function to convert a single hexadecimal digit to its decimal equivalent
def hex_digit_to_decimal(digit):
    if digit.isdigit():
        return int(digit)
    else:
        return ord(digit.upper()) - ord('A') + 10

# Function to convert a hexadecimal number to its decimal equivalent
def hex_to_decimal(hex_num):
    decimal_value = 0
    power = 0
    for digit in reversed(hex_num):
        decimal_value += hex_digit_to_decimal(digit) * (16 ** power)
        power += 1
    return decimal_value

# Main function to drive the program
def main():
    # Prompt the user for a hexadecimal number
    hex_num = input("Enter a hexadecimal number: ")

    # Validate the input
    if not is_valid_hex(hex_num):
        print("Invalid hexadecimal number.")
        return

    # Convert the hexadecimal number to decimal
    decimal_value = hex_to_decimal(hex_num)

    # Display the result
    print(f"The decimal equivalent of {hex_num} is {decimal_value}.")

# Call the main function to execute the program
if __name__ == "__main__":
    main()

