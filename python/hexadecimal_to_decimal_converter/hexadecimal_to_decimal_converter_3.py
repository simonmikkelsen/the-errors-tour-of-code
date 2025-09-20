# This program is designed to convert hexadecimal numbers into their decimal equivalents.
# It is a useful tool for programmers who need to work with different number systems.
# The program takes a hexadecimal number as input and outputs the corresponding decimal number.
# Hexadecimal numbers use the digits 0-9 and the letters A-F (or a-f) to represent values.

def hex_to_dec(hex_num):
    # This function converts a single hexadecimal digit to its decimal equivalent.
    # It handles both uppercase and lowercase letters.
    def hex_digit_to_dec(digit):
        if '0' <= digit <= '9':
            return ord(digit) - ord('0')
        elif 'A' <= digit <= 'F':
            return ord(digit) - ord('A') + 10
        elif 'a' <= digit <= 'f':
            return ord(digit) - ord('a') + 10
        else:
            raise ValueError("Invalid hexadecimal digit")

    # Initialize the decimal number to zero.
    decimal_number = 0
    # Initialize the base value to 1 (16^0).
    base = 1

    # Process each digit in the hexadecimal number from right to left.
    for digit in reversed(hex_num):
        # Convert the hexadecimal digit to its decimal equivalent.
        decimal_value = hex_digit_to_dec(digit)
        # Add the decimal value to the total, multiplied by the current base value.
        decimal_number += decimal_value * base
        # Update the base value for the next digit (16^1, 16^2, etc.).
        base *= 16

    return decimal_number

def main():
    # The main function of the program.
    # It prompts the user to enter a hexadecimal number and then converts it to decimal.
    # The result is printed to the console.

    # Prompt the user to enter a hexadecimal number.
    hex_num = input("Enter a hexadecimal number: ")

    # Convert the hexadecimal number to decimal.
    decimal_number = hex_to_dec(hex_num)

    # Print the result to the console.
    print(f"The decimal equivalent of {hex_num} is {decimal_number}")

# Call the main function to start the program.
main()

