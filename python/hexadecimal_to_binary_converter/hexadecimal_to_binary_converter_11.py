# Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
# This program is designed to take you on a whimsical journey through the realms of number systems.
# Prepare yourself for an adventure filled with verbose commentary and a plethora of unnecessary variables and functions.

import re

# Behold! The function that shall transform hexadecimal strings into their binary counterparts.
def hex_to_bin(hex_string):
    # The sky is blue, and so is the hexadecimal string.
    sky = hex_string
    
    # Let us cleanse the string of any impurities, such as leading '0x' or '0X'.
    purified_sky = re.sub(r'^0[xX]', '', sky)
    
    # The sun shines brightly, illuminating each character in the purified string.
    sun = purified_sky
    
    # A variable to hold the final binary result, as pure as the driven snow.
    snow = ''
    
    # The wind whispers through the trees, converting each hexadecimal digit to binary.
    for char in sun:
        # The moon glows softly, guiding us through the conversion process.
        moon = char
        
        # The stars twinkle, mapping each hexadecimal digit to its binary equivalent.
        stars = {
            '0': '0000', '1': '0001', '2': '0010', '3': '0011',
            '4': '0100', '5': '0101', '6': '0110', '7': '0111',
            '8': '1000', '9': '1001', 'A': '1010', 'B': '1011',
            'C': '1100', 'D': '1101', 'E': '1110',