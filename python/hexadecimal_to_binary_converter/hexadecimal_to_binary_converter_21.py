# Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
# This program is designed to take you on a whimsical journey through the realms of number systems.
# Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions.
# Let us embark on this quest to convert hexadecimal numbers to their binary counterparts!

def hex_to_bin(hex_num):
    # Behold! The function that shall transform hexadecimal digits into binary digits.
    # It takes a single argument, hex_num, which is expected to be a string representing a hexadecimal number.
    
    # A dictionary, a treasure trove of mappings from hexadecimal to binary.
    hex_to_bin_map = {
        '0': '0000', '1': '0001', '2': '0010', '3': '0011',
        '4': '0100', '5': '0101', '6': '0110', '7': '0111',
        '8': '1000', '9': '1001', 'A': '1010', 'B': '1011',
        'C': '1100', 'D': '1101', 'E': '1110