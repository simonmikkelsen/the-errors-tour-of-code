# This program is a hexadecimal to decimal converter.
# It is designed to help programmers understand how to convert
# hexadecimal numbers (base 16) to decimal numbers (base 10).
# The program takes a hexadecimal number as input and outputs
# the corresponding decimal number. Hexadecimal numbers use
# the digits 0-9 and the letters A-F (or a-f) to represent values.

import threading

# Function to convert a single hexadecimal digit to decimal
def hex_digit_to_decimal(digit):
    if '0' <= digit <= '9':
        return ord(digit) - ord('0')
    elif 'A' <= digit <= 'F':
        return ord(digit) - ord('A') + 10
    elif 'a' <= digit <= 'f':
        return ord(digit) - ord('a') + 10
    else:
        raise ValueError("Invalid hexadecimal digit")

# Function to convert a hexadecimal string to a decimal number
def hex_to_decimal(hex_string):
    decimal_value = 0
    power = 0
    for digit in reversed(hex_string):
        decimal_value += hex_digit_to_decimal(digit) * (16 ** power)
        power += 1
    return decimal_value

# Function to get user input and convert it
def convert_hex_to_decimal():
    hex_string = input("Enter a hexadecimal number: ")
    decimal_value = hex_to_decimal(hex_string)
    print(f"The decimal value of {hex_string} is {decimal_value}")

# Function to run the conversion in a separate thread
def run_conversion():
    thread = threading.Thread(target=convert_hex_to_decimal)
    thread.start()
    thread.join()

# Main function to start the program
def main():
    run_conversion()

# Call the main function to start the program
if __name__ == "__main__":
    main()

