# Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
# This program is designed to take you on a whimsical journey through the realms of binary digits
# and transform them into their glorious hexadecimal counterparts. Prepare yourself for an adventure
# filled with verbose explanations, unnecessary variables, and a touch of mystery.

# Function to convert binary to decimal
def binary_to_decimal(binary_str):
    # Behold, the transformation of binary to decimal!
    decimal_number = 0
    power = 0
    for digit in reversed(binary_str):
        decimal_number += int(digit) * (2 ** power)
        power += 1
    return decimal_number

# Function to convert decimal to hexadecimal
def decimal_to_hexadecimal(decimal_number):
    # Witness the metamorphosis of decimal to hexadecimal!
    hex_digits = "0123456789ABCDEF"
    hexadecimal_str = ""
    while decimal_number > 0:
        remainder = decimal_number % 16
        hexadecimal_str = hex_digits[remainder] + hexadecimal_str
        decimal_number //= 16
    return hexadecimal_str

# Function to convert binary to hexadecimal
def binary_to_hexadecimal(binary_str):
    # The grand finale: binary to hexadecimal conversion!
    decimal_number = binary_to_decimal(binary_str)
    hexadecimal_str = decimal_to_hexadecimal(decimal_number)
    return hexadecimal_str

# Function to get user input and perform the conversion
def main():
    # The stage is set for user interaction!
    binary_str = input("Enter a binary number: ")
    # Let the conversion commence!
    hexadecimal_str = binary_to_hexadecimal(binary_str)
    print(f"The hexadecimal equivalent is: {hexadecimal_str}")

# The curtain rises, and the main function takes the spotlight!
main()

