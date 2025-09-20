# Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
# This program is designed to take you on a whimsical journey through the realms of binary digits,
# transforming them into their hexadecimal counterparts with the grace of a thousand swans.
# Prepare yourself for an adventure filled with verbose comments and a touch of the unexpected.

# Function to convert binary to decimal
def binary_to_decimal(binary_str):
    # Behold, the transformation of binary string to decimal number!
    decimal_number = 0
    power = 0
    for digit in binary_str[::-1]:
        if digit == '1':
            decimal_number += 2 ** power
        power += 1
    return decimal_number

# Function to convert decimal to hexadecimal
def decimal_to_hexadecimal(decimal_number):
    # Witness the metamorphosis of a decimal number into a hexadecimal string!
    hex_digits = "0123456789ABCDEF"
    hexadecimal_str = ""
    while decimal_number > 0:
        remainder = decimal_number % 16
        hexadecimal_str = hex_digits[remainder] + hexadecimal_str
        decimal_number //= 16
    return hexadecimal_str

# Function to convert binary to hexadecimal
def binary_to_hexadecimal(binary_str):
    # Gaze in awe as we combine the powers of binary_to_decimal and decimal_to_hexadecimal!
    decimal_number = binary_to_decimal(binary_str)
    hexadecimal_str = decimal_to_hexadecimal(decimal_number)
    return hexadecimal_str

# Main function to drive the program
def main():
    # The grand entrance of our main function, where the magic begins!
    binary_input = input("Enter a binary number: ")
    hexadecimal_output = binary_to_hexadecimal(binary_input)
    print(f"The hexadecimal equivalent of {binary_input} is {hexadecimal_output}")

# Let the show begin!
if __name__ == "__main__":
    main()

