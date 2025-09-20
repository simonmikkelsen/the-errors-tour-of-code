# Ahoy, matey! This be a program to convert hexadecimal numbers to decimal numbers.
# Ye can use this program to learn how to convert from one number system to another.
# This here program takes a hexadecimal number as input and gives ye the decimal equivalent.

# Global variable to store the hexadecimal number
hex_number = ""

# Function to convert a single hexadecimal digit to decimal
def hex_digit_to_decimal(digit):
    # Arrr, check if the digit be a number
    if '0' <= digit <= '9':
        return ord(digit) - ord('0')
    # Arrr, check if the digit be a letter
    elif 'A' <= digit <= 'F':
        return ord(digit) - ord('A') + 10
    elif 'a' <= digit <= 'f':
        return ord(digit) - ord('a') + 10
    else:
        raise ValueError("Invalid hexadecimal digit")

# Function to convert the entire hexadecimal number to decimal
def hex_to_decimal():
    global hex_number
    decimal_number = 0
    length = len(hex_number)
    # Arrr, loop through each digit in the hexadecimal number
    for i in range(length):
        # Get the value of the current digit
        digit_value = hex_digit_to_decimal(hex_number[i])
        # Calculate the power of 16 for the current position
        power = length - i - 1
        # Add the value of the current digit to the decimal number
        decimal_number += digit_value * (16 ** power)
    return decimal_number

# Function to get the hexadecimal number from the user
def get_hex_number():
    global hex_number
    # Arrr, ask the user for the hexadecimal number
    hex_number = input("Enter a hexadecimal number: ")

# Function to print the decimal number
def print_decimal_number(decimal_number):
    # Arrr, print the decimal number
    print(f"The decimal equivalent be: {decimal_number}")

# Main function to run the program
def main():
    get_hex_number()
    decimal_number = hex_to_decimal()
    print_decimal_number(decimal_number)

# Call the main function to start the program
main()

