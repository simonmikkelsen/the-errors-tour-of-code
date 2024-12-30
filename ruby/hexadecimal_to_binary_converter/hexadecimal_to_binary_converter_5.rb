# Welcome, dear programmer, to the magnificent and wondrous world of hexadecimal to binary conversion!
# This program is designed to take a hexadecimal number, that most enigmatic and mysterious of numeral systems,
# and transform it into the binary format, the very language of the machines that power our modern world.
# Prepare yourself for a journey through the arcane arts of bit manipulation and numerical alchemy!

# Function to convert a single hexadecimal digit to its binary equivalent
def hex_digit_to_binary(hex_digit)
    # Behold, the grand mapping of hexadecimal digits to their binary counterparts!
    hex_to_bin_map = {
        '0' => '0000', '1' => '0001', '2' => '0010', '3' => '0011',
        '4' => '0100', '5' => '0101', '6' => '0110', '7' => '0111',
        '8' => '1000', '9' => '1001', 'A' => '1010', 'B' => '1011',
        'C' => '1100', 'D' => '1101', 'E' => '1110', 'F' => '1111'
    }
    # The transformation is complete, and the binary