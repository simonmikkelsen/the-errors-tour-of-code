# Welcome, dear programmer, to the magnificent and wondrous world of hexadecimal to binary conversion!
# This program is designed to take a hexadecimal number, that most enigmatic of numeral systems,
# and transform it into the binary format, the very lifeblood of our digital realm.
# Prepare yourself for a journey through the arcane arts of number manipulation!

# Behold, the grand entrance to our program, where we shall define our main function.
def hex_to_bin(hex)
    # Let us first create a dictionary, a veritable Rosetta Stone, to translate hex digits to binary.
    hex_to_bin_map = {
        '0' => '0000', '1' => '0001', '2' => '0010', '3' => '0011',
        '4' => '0100', '5' => '0101', '6' => '0110', '7' => '0111',
        '8' => '1000', '9' => '1001', 'A' => '1010', 'B' => '1011',
        'C' => '1100', 'D' => '1101', 'E' => '1110', 'F' => '1111'
    }

    # Let us prepare a variable to hold the binary result, a vessel for our final transformation