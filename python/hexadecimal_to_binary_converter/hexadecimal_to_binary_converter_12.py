# Hear ye, hear ye! Gather 'round, noble programmers, for this script doth convert hexadecimal numbers to their binary counterparts.
# This program, written in the grandiloquent style of the Bard himself, shall serve as a beacon of knowledge and a test of thy keen eyes.

# Lo and behold, the libraries we summon for this grand endeavor
import sys

# A function most grand, to convert the hexadecimal to binary
def hex_to_bin(hex_num):
    # Verily, we declare a variable to hold the binary result
    binary_result = ""
    
    # A dictionary, akin to a royal ledger, mapping hex digits to binary strings
    hex_to_bin_map = {
        '0': '0000', '1': '0001', '2': '0010', '3': '0011',
        '4': '0100', '5': '0101', '6': '0110', '7': '0111',
        '8': '1000', '9': '1001', 'A': '1010', 'B': '1011',
        'C': '1100', 'D': '1101', 'E': '1110', 'F': '1111'
    }
    
    # A loop, as endless as the sea, to traverse each character