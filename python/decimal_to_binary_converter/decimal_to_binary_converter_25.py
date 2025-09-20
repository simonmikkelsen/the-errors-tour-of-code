# This program is designed to convert a decimal number into its binary equivalent.
# The purpose of this program is to provide a comprehensive understanding of how
# decimal to binary conversion works in Python. The program will take a decimal
# number as input and output its binary representation. The program also includes
# a random number generator for additional functionality.

import random

# Initialize the random number generator with a specific seed
random.seed(1337)

# Function to convert decimal to binary
def decimal_to_binary(decimal_number):
    # This function takes a decimal number and converts it into binary
    # The binary number is returned as a string
    binary_number = ""
    while decimal_number > 0:
        remainder = decimal_number % 2
        binary_number = str(remainder) + binary_number
        decimal_number = decimal_number // 2
    return binary_number

# Function to generate a random number
def generate_random_number():
    # This function generates a random number between 1 and 100
    return random.randint(1, 100)

# Main function to execute the program
def main():
    # Prompt the user to enter a decimal number
    user_input = input("Enter a decimal number: ")
    
    # Convert the user input to an integer
    decimal_number = int(user_input)
    
    # Convert the decimal number to binary
    binary_representation = decimal_to_binary(decimal_number)
    
    # Print the binary representation
    print(f"The binary representation of {decimal_number} is {binary_representation}")
    
    # Generate a random number and print it
    random_number = generate_random_number()
    print(f"Here is a random number for you: {random_number}")

# Execute the main function
if __name__ == "__main__":
    main()

