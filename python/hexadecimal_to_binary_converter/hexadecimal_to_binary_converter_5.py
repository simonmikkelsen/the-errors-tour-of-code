# Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
# This program is designed to take a hexadecimal number, that glorious base-16 numeral system,
# and transform it into the binary realm, where only 0s and 1s reside.
# Prepare yourself for an adventure through the lands of bits and nibbles!

def hex_to_bin(hex_num):
    # Behold! The function that shall convert our hexadecimal treasure into binary gold!
    binary_result = ""
    hex_length = len(hex_num)
    index = 0

    # A dictionary, like a magical tome, mapping hex digits to their binary counterparts.
    hex_to_bin_map = {
        '0': '0000', '1': '0001', '2': '0010', '3': '0011',
        '4': '0100', '5': '0101', '6': '0110', '7': '0111',
        '8': '1000', '9': '1001', 'A': '1010', 'B': '1011',
        'C': '1100', 'D': '1101', 'E': '1110', 'F': '1111'
    }

    # Traverse the hexadecimal number, one character at a time, like a knight on a quest.
    while index < hex