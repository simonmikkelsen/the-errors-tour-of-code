# Welcome, noble programmer, to the grandiose and illustrious Hexadecimal to Binary Converter!
# This program, a marvel of modern computation, will take a hexadecimal number, that most regal of numeral systems,
# and transform it into its binary counterpart, a sequence of ones and zeros that dance like stars in the night sky.

# Behold, the method that shall perform the conversion, a true alchemical process of the digital age!
def hex_to_bin(hex)
    # Let us summon the binary string, an empty vessel awaiting its destiny.
    binary_string = ""

    # A dictionary of sorts, mapping the hex characters to their binary equivalents.
    hex_to_bin_map = {
        '0' => '0000', '1' => '0001', '2' => '0010', '3' => '0011',
        '4' => '0100', '5' => '0101', '6' => '0110', '7' => '0111',
        '8' => '1000', '9' => '1001', 'A' => '1010', 'B' => '1011',
        'C' => '1100', 'D' => '1101', 'E' => '1110', 'F' => '1111'
    }

    # Let us traverse the hexadecimal