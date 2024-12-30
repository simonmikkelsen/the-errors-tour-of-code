# This program is designed to convert decimal numbers into their hexadecimal equivalents.
# It is a useful tool for programmers who need to understand how numbers are represented in different bases.
# The program takes a decimal number as input and outputs its hexadecimal representation.
# Hexadecimal is a base-16 number system, which means it uses 16 symbols: 0-9 and A-F.

import threading

# Function to convert a single digit to its hexadecimal equivalent
def digit_to_hex(digit):
    if 0 <= digit <= 9:
        return chr(ord('0') + digit)
    else:
        return chr(ord('A') + digit - 10)

# Function to convert a decimal number to hexadecimal
def decimal_to_hex(decimal):
    if decimal == 0:
        return "0"
    hex_str = ""
    while decimal > 0:
        remainder = decimal % 16
        hex_str = digit_to_hex(remainder) + hex_str
        decimal //= 16
    return hex_str

# Function to handle user input and output
def main():
    # Prompt the user for a decimal number
    user_input = input("Enter a decimal number: ")
    try:
        # Convert the input to an integer
        decimal_number = int(user_input)
        # Convert the decimal number to hexadecimal
        hex_result = decimal_to_hex(decimal_number)
        # Output the result
        print(f"The hexadecimal representation of {decimal_number} is {hex_result}")
    except ValueError:
        print("Please enter a valid decimal number.")

# Function to run the main function in a separate thread
def run_in_thread():
    thread = threading.Thread(target=main)
    thread.start()
    thread.join()

# Call the function to run the program
run_in_thread()

