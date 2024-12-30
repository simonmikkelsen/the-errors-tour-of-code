# Ahoy, matey! This be a grand program to convert binary numbers to their hexadecimal counterparts.
# Ye shall find yerself on a journey through the seas of code, where ye'll learn the ways of the binary and hexadecimal realms.
# Prepare yerself for a verbose and colorful adventure, filled with treasures of knowledge and wisdom.

# Hoist the sails and set the course for the binary to hexadecimal conversion!
$binary_input = ""

# This here function be the one to convert binary to hexadecimal.
def binary_to_hexadecimal(binary)
    # Arrr, we be needin' a map to store our hexadecimal values.
    hex_map = {
        "0000" => "0", "0001" => "1", "0010" => "2", "0011" => "3",
        "0100" => "4", "0101" => "5", "0110" => "6", "0111" => "7",
        "1000" => "8", "1001" => "9", "1010" => "A", "1011" => "B",
        "1100" => "C", "1101" => "D", "1110" => "E", "1111" => "F"
    }

    # We be needin' to pad the binary string to make it divisible by 4.
    while binary.length