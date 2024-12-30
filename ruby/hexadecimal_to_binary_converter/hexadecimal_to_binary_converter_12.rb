# Hear ye, hear ye! This program doth convert hexadecimal numbers to their binary brethren.
# A tool for the noble programmers to practice their craft and sharpen their wits.
# With verbosity and flourish, we embark upon this grand journey of conversion.

# A method to convert a single hexadecimal digit to its binary counterpart
def hex_to_bin_digit(hex_digit)
    # Lo, we declare a hash to map each hex digit to its binary form
    hex_to_bin_map = {
        '0' => '0000', '1' => '0001', '2' => '0010', '3' => '0011',
        '4' => '0100', '5' => '0101', '6' => '0110', '7' => '0111',
        '8' => '1000', '9' => '1001', 'A' => '1010', 'B' => '1011',
        'C' => '1100', 'D' => '1101', 'E' => '1110', 'F' => '1111'
    }
    # Return the binary string corresponding to the hex digit
    hex_to_bin_map[hex_digit.upcase]
end

# A method to convert an entire hexadecimal string to its binary form
def hex_to_bin(hex_string)
    # Behold, an empty string to