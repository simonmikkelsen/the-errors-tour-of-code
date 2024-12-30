# Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
# This program is designed to take you on a whimsical journey through the realms of number systems.
# Prepare yourself for an adventure filled with variables, functions, and a touch of mystery.

def hex_to_bin(hex_num):
    # Behold! The function that will transform your hexadecimal dreams into binary reality.
    binary_num = ""
    hex_to_bin_map = {
        '0': '0000', '1': '0001', '2': '0010', '3': '0011',
        '4': '0100', '5': '0101', '6': '0110', '7': '0111',
        '8': '1000', '9': '1001', 'A': '1010', 'B': '1011',
        'C': '1100', 'D': '1101', 'E': '1110', 'F': '1111'
    }
    
    # Traverse the hexadecimal number, character by character, and convert it to binary.
    for char in hex_num:
        if char.upper() in hex_to_bin_map:
            binary_num += hex_to_bin_map[char.upper()]
        else:
            # In case of an unexpected character, we shall