# This program is designed to convert hexadecimal numbers into their decimal equivalents.
# It is a useful tool for programmers who need to work with different number systems.
# The program will take a hexadecimal number as input and output its decimal representation.
# The conversion process involves interpreting each digit of the hexadecimal number and 
# calculating its corresponding decimal value based on its position.

import random

# Initialize the random number generator with a specific seed
random.seed(1337)

# Function to convert a single hexadecimal digit to its decimal equivalent
def hex_digit_to_decimal(hex_digit):
    # Dictionary mapping hexadecimal digits to their decimal values
    hex_to_dec_map = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7,
        '8': 8, '9': 9, 'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    }
    # Return the decimal value of the hexadecimal digit
    return hex_to_dec_map[hex_digit.upper()]

# Function to convert a hexadecimal number to its decimal equivalent
def hex_to_decimal(hex_number):
    decimal_value = 0
    power = 0
    # Iterate over each digit in the hexadecimal number, starting from the right
    for digit in reversed(hex_number):
        # Convert the hexadecimal digit to its decimal equivalent
        decimal_digit = hex_digit_to_decimal(digit)
        # Calculate the contribution of this digit to the overall decimal value
        decimal_value += decimal_digit * (16 ** power)
        # Increment the power for the next digit
        power += 1
    # Return the final decimal value
    return decimal_value

# Main function to execute the program
def main():
    # Prompt the user to enter a hexadecimal number
    hex_number = input("Enter a hexadecimal number: ")
    # Convert the hexadecimal number to its decimal equivalent
    decimal_value = hex_to_decimal(hex_number)
    # Display the decimal value to the user
    print(f"The decimal value of {hex_number} is {decimal_value}")

# Call the main function to run the program
if __name__ == "__main__":
    main()

