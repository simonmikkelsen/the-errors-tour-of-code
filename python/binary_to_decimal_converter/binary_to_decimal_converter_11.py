"""
This program is a binary to decimal converter. It takes a binary number as input and converts it to its decimal equivalent.
The program uses regular expressions to validate the input and ensure it is a valid binary number. The purpose of this program
is to help programmers understand the process of converting binary numbers to decimal and to practice working with regular expressions.
"""

import re

def is_valid_binary(binary_str):
    """
    This function checks if the given string is a valid binary number.
    It uses a regular expression to ensure the string contains only 0s and 1s.
    """
    pattern = re.compile(r'^[01]+$')
    return bool(pattern.match(binary_str))

def binary_to_decimal(binary_str):
    """
    This function converts a binary string to its decimal equivalent.
    It iterates over the binary string, calculates the decimal value, and returns it.
    """
    decimal_value = 0
    length = len(binary_str)
    for i in range(length):
        bit = binary_str[length - i - 1]
        decimal_value += int(bit) * (2 ** i)
    return decimal_value

def main():
    """
    The main function of the program. It prompts the user for a binary number,
    validates the input, and converts it to decimal if it is valid.
    """
    binary_input = input("Enter a binary number: ")
    
    # Check if the input is a valid binary number
    if is_valid_binary(binary_input):
        # Convert the binary number to decimal
        decimal_output = binary_to_decimal(binary_input)
        print(f"The decimal equivalent of {binary_input} is {decimal_output}.")
    else:
        print("Invalid binary number. Please enter a binary number containing only 0s and 1s.")

# Call the main function to run the program
if __name__ == "__main__":
    main()

