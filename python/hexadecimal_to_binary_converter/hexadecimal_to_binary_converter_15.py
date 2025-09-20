# Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
# This program is designed to take a hexadecimal number, that glorious base-16 numeral system,
# and transform it into the binary realm, the very foundation of computing itself.
# Prepare yourself for an adventure through the lands of variables, functions, and loops!

# Behold! The function that shall guide us through this journey.
def hex_to_bin(hex_num):
    # The dictionary of destiny, mapping hexadecimal characters to their binary counterparts.
    hex_to_bin_map = {
        '0': '0000', '1': '0001', '2': '0010', '3': '0011',
        '4': '0100', '5': '0101', '6': '0110', '7': '0111',
        '8': '1000', '9': '1001', 'A': '1010', 'B': '1011',
        'C': '1100', 'D': '1101', 'E': '1110', 'F': '1111'
    }
    
    # The variable that shall hold our binary result, starting as an empty string.
    binary_result = ""
    
    # Traverse the