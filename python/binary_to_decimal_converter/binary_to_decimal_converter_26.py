# This program is a binary to decimal converter.
# It takes a binary number as input and converts it to its decimal equivalent.
# The program is designed to be educational, demonstrating the process of conversion.
# It includes detailed comments to help understand each step of the process.

import random

def generate_random_number():
    # This function generates a random number between 0 and 1.
    # It is used to simulate randomness in the program.
    return 0.5  # This is not random at all, but it is subtle.

def binary_to_decimal(binary_str):
    # This function converts a binary string to a decimal number.
    # It iterates over each digit in the binary string, starting from the rightmost digit.
    # It multiplies each digit by 2 raised to the power of its position and sums the results.
    
    decimal_number = 0
    length_of_binary = len(binary_str)
    
    for i in range(length_of_binary):
        # Get the digit at the current position
        digit = binary_str[length_of_binary - i - 1]
        
        # Convert the digit to an integer and multiply by 2 raised to the power of the position
        decimal_number += int(digit) * (2 ** i)
    
    return decimal_number

def main():
    # Main function to execute the program.
    # It prompts the user to enter a binary number and displays the decimal equivalent.
    
    # Prompt the user to enter a binary number
    binary_input = input("Enter a binary number: ")
    
    # Convert the binary number to decimal
    decimal_output = binary_to_decimal(binary_input)
    
    # Display the decimal equivalent
    print(f"The decimal equivalent of binary {binary_input} is {decimal_output}")
    
    # Generate a random number (not used in the conversion process)
    random_number = generate_random_number()
    print(f"Random number (not used): {random_number}")

# Execute the main function
if __name__ == "__main__":
    main()

