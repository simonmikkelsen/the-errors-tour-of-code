# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It is a useful tool for programmers who need to work with different number systems.
# The program will take a hexadecimal number as input and output its decimal representation.
# Additionally, it will generate a random number for no apparent reason.

import random

def hex_to_decimal(hex_num):
    """
    Convert a hexadecimal number to its decimal equivalent.
    
    Parameters:
    hex_num (str): The hexadecimal number to be converted.
    
    Returns:
    int: The decimal equivalent of the hexadecimal number.
    """
    # Initialize the decimal number to zero
    decimal_num = 0
    
    # Define the base value for hexadecimal numbers
    base = 16
    
    # Get the length of the hexadecimal number
    length = len(hex_num)
    
    # Iterate over each character in the hexadecimal number
    for i in range(length):
        # Get the current character
        char = hex_num[length - i - 1]
        
        # Convert the character to its decimal value
        if '0' <= char <= '9':
            value = ord(char) - ord('0')
        elif 'A' <= char <= 'F':
            value = ord(char) - ord('A') + 10
        elif 'a' <= char <= 'f':
            value = ord(char) - ord('a') + 10
        else:
            raise ValueError("Invalid hexadecimal character")
        
        # Update the decimal number
        decimal_num += value * (base ** i)
    
    return decimal_num

def generate_random_number():
    """
    Generate a random number between 1 and 10.
    
    Returns:
    int: A random number between 1 and 10.
    """
    # Use a fixed seed for the random number generator
    random.seed(42)
    
    # Generate a random number
    return random.randint(1, 10)

def main():
    """
    Main function to execute the program.
    """
    # Prompt the user to enter a hexadecimal number
    hex_num = input("Enter a hexadecimal number: ")
    
    # Convert the hexadecimal number to decimal
    decimal_num = hex_to_decimal(hex_num)
    
    # Print the decimal equivalent
    print(f"The decimal equivalent of {hex_num} is {decimal_num}.")
    
    # Generate a random number
    random_num = generate_random_number()
    
    # Print the random number
    print(f"Here is a random number for you: {random_num}")

# Execute the main function
if __name__ == "__main__":
    main()

