# Welcome, noble programmer, to the grandiose and magnificent Hexadecimal to Binary Converter!
# This program is designed to take a hexadecimal number, that most enigmatic of numeral systems,
# and transform it into the binary format, the very lifeblood of our beloved computing machines.
# Prepare yourself for a journey through the realms of code, where we shall encounter variables,
# functions, and loops aplenty, all working in concert to achieve our lofty goal.

# Behold, the conversion function, where the magic happens!
def hex_to_bin(hex)
    # Let us first declare a variable to hold our binary result, an empty string for now.
    binary_result = ""

    # A dictionary of sorts, mapping each hexadecimal digit to its binary counterpart.
    hex_to_bin_map = {
        '0' => '0000', '1' => '0001', '2' => '0010', '3' => '0011',
        '4' => '0100', '5' => '0101', '6' => '0110', '7' => '0111',
        '8' => '1000', '9' => '1001', 'A' => '1010