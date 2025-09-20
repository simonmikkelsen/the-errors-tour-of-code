# Ahoy, matey! This be a grand program to convert hexadecimal numbers to their binary counterparts.
# Ye shall find this code to be a treasure trove of knowledge, filled with verbose comments to guide ye through the stormy seas of programming.
# Hoist the sails and prepare to embark on a journey of learning and discovery!

# Global variable to store the hexadecimal input from the user
$hex_input = ""

# Function to get the hexadecimal input from the user
def get_hex_input
    # Arrr, ask the user for a hexadecimal number
    puts "Enter a hexadecimal number, ye scallywag:"
    $hex_input = gets.chomp
end

# Function to convert a single hexadecimal digit to binary
def hex_digit_to_binary(hex_digit)
    # Shiver me timbers! This be a map of hexadecimal digits to their binary equivalents
    hex_to_bin_map = {
        '0' => '0000', '1' => '0001', '2' => '0010', '3' => '0011',
        '4' => '0100', '5' => '0101', '6' => '0110', '7' => '0111',
        '8' => '1000', '9' => '1001', 'A' => '1010', 'B' => '1011',
        'C' => '1100', 'D' => '1101', 'E' => '1110', 'F' => '1111'
    }
    # Return the binary equivalent of the hexadecimal digit
    hex_to_bin_map[hex_digit.upcase]
end

# Function to convert the entire hexadecimal number to binary
def hex_to_binary(hex_number)
    # Arrr, initialize an empty string to store the binary result
    binary_result = ""
    # Walk the plank! Iterate over each character in the hexadecimal number
    hex_number.each