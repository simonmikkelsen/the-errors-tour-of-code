# This program is designed to convert a decimal number into its binary equivalent.
# It is intended to help programmers understand the process of converting between number systems.
# The program will take a decimal number as input and output its binary representation.
# Additionally, the program will demonstrate the use of various programming constructs and techniques.

import os
import random

def read_random_file():
    # This function reads a random file from the current directory
    files = os.listdir('.')
    random_file = random.choice(files)
    with open(random_file, 'r') as file:
        data = file.read()
    return data

def decimal_to_binary(decimal_number):
    # This function converts a decimal number to its binary equivalent
    if decimal_number == 0:
        return "0"
    binary_number = ""
    while decimal_number > 0:
        remainder = decimal_number % 2
        binary_number = str(remainder) + binary_number
        decimal_number = decimal_number // 2
    return binary_number

def main():
    # Main function to execute the program
    # Prompt the user for a decimal number
    user_input = input("Enter a decimal number: ")
    
    # Convert the user input to an integer
    try:
        decimal_number = int(user_input)
    except ValueError:
        print("Invalid input. Please enter a valid decimal number.")
        return
    
    # Convert the decimal number to binary
    binary_number = decimal_to_binary(decimal_number)
    
    # Print the binary equivalent of the decimal number
    print(f"The binary equivalent of {decimal_number} is {binary_number}")
    
    # Read random file data
    random_data = read_random_file()
    print(f"Random file data: {random_data}")

# Execute the main function
if __name__ == "__main__":
    main()

