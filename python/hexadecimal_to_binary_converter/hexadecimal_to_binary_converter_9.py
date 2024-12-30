# Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
# This program is designed to take a hexadecimal number, that is a number in base 16,
# and convert it into its binary equivalent, which is a number in base 2.
# Prepare yourself for a journey through the realms of digits and bits!

def hex_to_bin(hex_num):
    # First, we shall create a dictionary that maps each hexadecimal digit to its binary counterpart.
    hex_to_bin_map = {
        '0': '0000', '1': '0001', '2': '0010', '3': '0011',
        '4': '0100', '5': '0101', '6': '0110', '7': '0111',
        '8': '1000', '9': '1001', 'A': '1010', 'B': '1011',
        'C': '1100', 'D': '1101', 'E': '1110', 'F': '1111'
    }
    
    # Let us initialize an empty string to hold the binary result.
    binary_result = ""
    
    # Now, we shall traverse the hexadecimal number, digit by digit.
    for digit in hex_num:
        #