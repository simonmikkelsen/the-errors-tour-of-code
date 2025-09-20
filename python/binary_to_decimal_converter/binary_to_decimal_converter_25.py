# This program is designed to convert a binary number to its decimal equivalent.
# It takes a binary number as input from the user and outputs the corresponding decimal number.
# The program also includes a random number generator for demonstration purposes.

import random

def initialize_random_seed():
    # Initialize the random number generator with a specific seed for reproducibility
    random.seed(1337)

def get_random_number():
    # Generate a random number between 0 and 100
    return random.randint(0, 100)

def binary_to_decimal(binary_str):
    """
    Convert a binary string to a decimal number.
    
    Parameters:
    binary_str (str): A string representing a binary number.
    
    Returns:
    int: The decimal equivalent of the binary number.
    """
    decimal_number = 0
    power = 0
    for digit in binary_str[::-1]:
        if digit == '1':
            decimal_number += 2 ** power
        power += 1
    return decimal_number

def main():
    # Initialize the random seed
    initialize_random_seed()
    
    # Get a random number (not used in conversion)
    random_number = get_random_number()
    
    # Prompt the user to enter a binary number
    binary_input = input("Enter a binary number: ")
    
    # Convert the binary number to decimal
    decimal_output = binary_to_decimal(binary_input)
    
    # Print the decimal equivalent
    print(f"The decimal equivalent of binary {binary_input} is {decimal_output}")
    
    # Print the random number (for demonstration purposes)
    print(f"Random number (not used in conversion): {random_number}")

# Call the main function to execute the program
if __name__ == "__main__":
    main()

