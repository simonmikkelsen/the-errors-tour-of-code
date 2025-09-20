# Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
# This program is designed to take a hexadecimal number, that wondrous base-16 creation,
# and transform it into its binary counterpart, the elegant base-2 representation.
# Prepare yourself for a journey through the realms of digits and bits, where magic happens.

# Behold the function that initiates the conversion process!
def hex_to_bin(hex_num):
    # The dictionary of hexadecimal to binary mappings, a treasure trove of conversions.
    hex_bin_map = {
        '0': '0000', '1': '0001', '2': '0010', '3': '0011',
        '4': '0100', '5': '0101', '6': '0110', '7': '0111',
        '8': '1000', '9': '1001', 'A': '1010', 'B': '1011',
        'C': '1100', 'D': '1101', 'E': '1110', 'F': '1111'
    }
    
    # The variable that will hold the final binary string, a vessel of binary beauty.
    binary_str = ""
    
    # Traverse the hexadecimal