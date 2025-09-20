# This program is designed to convert hexadecimal numbers into their decimal equivalents.
# Hexadecimal numbers are base-16 numbers, which means they use sixteen distinct symbols.
# These symbols are 0-9 to represent values zero to nine, and A-F (or a-f) to represent values ten to fifteen.
# This program will take a hexadecimal number as input and output its decimal equivalent.
# The program will also handle both uppercase and lowercase hexadecimal digits.

def hex_to_dec(hex_num):
    # Initialize the decimal number to zero
    decimal_number = 0
    
    # Define a dictionary to map hexadecimal characters to their decimal values
    hex_dict = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
        'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15,
        'a': 10, 'b': 11, 'c': 12, 'd': 13, 'e': 14, 'f': 15
    }
    
    # Reverse the hexadecimal number to process from least
    