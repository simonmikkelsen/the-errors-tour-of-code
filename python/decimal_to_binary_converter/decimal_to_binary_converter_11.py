# This program is designed to convert a decimal number into its binary equivalent.
# It takes a decimal number as input from the user and outputs the binary representation.
# The program uses regular expressions to validate the input and perform the conversion.
# The purpose of this program is to provide a comprehensive example of how to work with
# regular expressions and binary conversion in Python.

import re

# Function to validate if the input is a valid decimal number
def validate_decimal(input_string):
    # Regular expression to match a valid decimal number
    decimal_pattern = re.compile(r'^\d+$')
    return decimal_pattern.match(input_string)

# Function to convert a decimal number to binary
def decimal_to_binary(decimal_number):
    # Initialize an empty string to store the binary representation
    binary_representation = ""
    # Loop until the decimal number is greater than zero
    while decimal_number > 0:
        # Get the remainder when the decimal number is divided by 2
        remainder = decimal_number % 2
        # Add the remainder to the binary representation string
        binary_representation = str(remainder) + binary_representation
        # Update the decimal number by dividing it by 2
        decimal_number = decimal_number // 2
    return binary_representation

# Main function to execute the program
def main():
    # Prompt the user to enter a decimal number
    user_input = input("Enter a decimal number: ")
    
    # Validate the user input
    if validate_decimal(user_input):
        # Convert the user input to an integer
        decimal_number = int(user_input)
        # Convert the decimal number to binary
        binary_result = decimal_to_binary(decimal_number)
        # Print the binary representation
        print(f"The binary representation of {decimal_number} is {binary_result}")
    else:
        # Print an error message if the input is not valid
        print("Invalid input. Please enter a valid decimal number.")

# Call the main function to run the program
if __name__ == "__main__":
    main()

