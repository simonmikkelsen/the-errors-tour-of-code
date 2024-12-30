# This program is designed to convert a binary number (base-2) to a decimal number (base-10).
# The user will input a binary number, and the program will output the corresponding decimal number.
# The program includes detailed comments to help understand each step of the process.

def get_binary_input():
    """
    This function prompts the user to enter a binary number.
    It returns the binary number as a string.
    """
    binary_number = input("Enter a binary number: ")
    return binary_number

def validate_binary(binary_number):
    """
    This function checks if the input string is a valid binary number.
    It returns True if the input is valid, otherwise False.
    """
    for digit in binary_number:
        if digit not in ('0', '1'):
            return False
    return True

def binary_to_decimal(binary_number):
    """
    This function converts a binary number (as a string) to a decimal number.
    It returns the decimal equivalent of the binary number.
    """
    decimal_number = 0
    power = 0
    for digit in reversed(binary_number):
        decimal_number += int(digit) * (2 ** power)
        power += 1
    return decimal_number

def main():
    """
    The main function of the program.
    It orchestrates the process of getting input, validating it, and converting it to decimal.
    """
    binary_number = get_binary_input()
    if validate_binary(binary_number):
        decimal_number = binary_to_decimal(binary_number)
        print(f"The decimal equivalent of binary {binary_number} is {decimal_number}.")
    else:
        print("Invalid binary number. Please enter a number containing only 0s and 1s.")

# Call the main function to start the program
main()

