# Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
# This program is designed to take a hexadecimal number, that is a number in base 16,
# and convert it into its binary equivalent, which is a number in base 2.
# Prepare yourself for a journey through the realms of Ruby, where we shall witness
# the transformation of numerical bases in a most splendid fashion.

# Function to convert a single hexadecimal digit to binary
def hex_digit_to_binary(hex_digit)
    # Behold the glorious hash map, a treasure trove of hexadecimal to binary mappings
    hex_to_bin_map = {
        '0' => '0000', '1' => '0001', '2' => '0010', '3' => '0011',
        '4' => '0100', '5' => '0101', '6' => '0110', '7' => '0111',
        '8' => '1000', '9' => '1001', 'A' => '1010', 'B' => '1011',
        'C' => '1100', 'D' => '1101', 'E' => '1110', 'F' => '1111'
    }
    # Retrieve the binary equivalent from the map
    hex_to_bin_map[hex_digit.upcase]
end

# Function to convert a hexadecimal