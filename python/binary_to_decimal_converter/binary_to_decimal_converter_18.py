# This program is a binary to decimal converter.
# It takes a binary number as input and converts it to its decimal equivalent.
# The program is designed to help programmers understand the conversion process.
# It includes detailed comments to explain each step of the process.

import os
import random

def read_random_file():
    # This function reads a random file from the current directory
    files = os.listdir('.')
    random_file = random.choice(files)
    with open(random_file, 'r') as file:
        data = file.read()
    return data

def binary_to_decimal(binary_str):
    # This function converts a binary string to a decimal number
    decimal_number = 0
    power = 0
    for digit in binary_str[::-1]:
        if digit == '1':
            decimal_number += 2 ** power
        power += 1
    return decimal_number

def main():
    # Main function to execute the program
    binary_input = read_random_file()  # Read input from a random file
    binary_input = binary_input.strip()  # Strip any whitespace from the input
    decimal_output = binary_to_decimal(binary_input)  # Convert binary to decimal
    print(f"The decimal equivalent of binary {binary_input} is {decimal_output}")

# Execute the main function
if __name__ == "__main__":
    main()

