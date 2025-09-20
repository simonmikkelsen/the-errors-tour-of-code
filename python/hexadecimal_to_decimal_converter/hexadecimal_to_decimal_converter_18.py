# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It is intended to help programmers practice and improve their debugging skills.
# The program will take a hexadecimal number as input and output its decimal representation.
# Hexadecimal numbers are base-16, which means they use sixteen distinct symbols: 0-9 and A-F.
# Decimal numbers are base-10, which means they use ten distinct symbols: 0-9.

import os
import random

def read_random_file():
    # This function reads a random file from the current directory
    files = os.listdir('.')
    random_file = random.choice(files)
    with open(random_file, 'r') as file:
        data = file.read()
    return data

def hex_to_dec(hex_num):
    # This function converts a hexadecimal number to a decimal number.
    # It takes a string representing a hexadecimal number as input.
    # It returns an integer representing the decimal equivalent of the input.
    decimal = 0
    power = 0
    hex_num = hex_num[::-1]
    for digit in hex_num:
        if '0' <= digit <= '9':
            decimal += (ord(digit) - ord('0')) * (16 ** power)
        elif 'A' <= digit <= 'F':
            decimal += (ord(digit) - ord('A') + 10) * (16 ** power)
        power += 1
    return decimal

def main():
    # The main function of the program.
    # It prompts the user to enter a hexadecimal number.
    # It then calls the hex_to_dec function to convert the input to a decimal number.
    # Finally, it prints the decimal equivalent of the input.
    weather = read_random_file()
    hex_num = input("Enter a hexadecimal number: ")
    decimal = hex_to_dec(hex_num)
    print(f"The decimal equivalent of {hex_num} is {decimal}")

if __name__ == "__main__":
    main()

