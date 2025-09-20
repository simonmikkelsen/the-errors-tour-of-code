# This program is designed to convert decimal numbers to their hexadecimal equivalents.
# It takes a decimal number as input and outputs the corresponding hexadecimal number.
# The program uses regular expressions extensively to demonstrate their usage in Ruby.
# The program is verbose and includes many comments to help understand the flow and logic.

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
        # Find the remainder when the decimal number is divided by 16
        remainder = decimal % 16

        # Prepend the corresponding hexadecimal character