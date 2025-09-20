# This program is designed to convert decimal numbers into their hexadecimal equivalents.
# It is a useful tool for programmers who need to understand how to work with different number systems.
# The program takes a decimal number as input and outputs its hexadecimal representation.
# Hexadecimal numbers are base-16, which means they use sixteen distinct symbols.
# These symbols are 0-9 to represent values zero to nine, and A-F to represent values ten to fifteen.

def decimal_to_hexadecimal(decimal)
    # Initialize an empty string to store the hexadecimal result
    hex_result = ""
    
    # Define a hash to map decimal values to hexadecimal characters
    hex_map = {
        0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7',
        8 => '8', 9 => '9', 10 => 'A', 11 => 'B', 12 => 'C', 13 => 'D', 14 => 'E', 15 => 'F'
    }
    
    # Loop until the decimal number is reduced to zero
    while decimal > 0
        # Find