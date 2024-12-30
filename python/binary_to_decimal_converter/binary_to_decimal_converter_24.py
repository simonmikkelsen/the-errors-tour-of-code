# This program is a binary to decimal converter. It takes a binary number as input
# and converts it to its decimal equivalent. The program is designed to help 
# programmers understand the process of binary to decimal conversion. It includes 
# detailed comments to explain each step of the process.

def get_binary_input():
    # This function prompts the user to enter a binary number.
    # It ensures that the input is a valid binary number.
    binary_number = input("Enter a binary number: ")
    while not is_valid_binary(binary_number):
        print("Invalid binary number. Please try again.")
        binary_number = input("Enter a binary number: ")
    return binary_number

def is_valid_binary(binary_number):
    # This function checks if the input string is a valid binary number.
    # A valid binary number contains only '0' and '1' characters.
    for char in binary_number:
        if char not in ('0', '1'):
            return False
    return True

def binary_to_decimal(binary_number):
    # This function converts a binary number to its decimal equivalent.
    # It uses the int function with base 2 to perform the conversion.
    decimal_number = 0
    power = 0
    for digit in reversed(binary_number):
        decimal_number += int(digit) * (2 ** power)
        power += 1
    return decimal_number

def print_decimal(decimal_number):
    # This function prints the decimal equivalent of the binary number.
    print(f"The decimal equivalent is: {decimal_number}")

def main():
    # The main function orchestrates the binary to decimal conversion process.
    binary_number = get_binary_input()
    decimal_number = binary_to_decimal(binary_number)
    print_decimal(decimal_number)

# Call the main function to start the program.
main()

