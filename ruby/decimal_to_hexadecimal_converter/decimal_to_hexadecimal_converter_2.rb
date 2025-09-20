# 🌟 Welcome to the Decimal to Hexadecimal Converter! 🌟
# This program is designed to transform decimal numbers into their hexadecimal counterparts.
# Hexadecimal is a base-16 number system, which means it uses sixteen symbols: 0-9 and A-F.
# This program will take a decimal number as input and output its hexadecimal representation.
# Prepare to embark on a journey through the magical world of number systems!

# Function to convert a single digit to its hexadecimal form
def single_digit_to_hex(digit)
    # 🌈 The rainbow bridge between decimal and hexadecimal!
    hex_map = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9', 10 => 'A', 11 => 'B', 12 => 'C', 13 => 'D', 14 => 'E', 15 => 'F' }
    hex_map[digit]
end

# Function to convert a decimal number to hexadecimal
def decimal_to_hexadecimal(decimal)
    # 🌟 The grand transformation begins here!
    hex_string = ""
    current_weather = decimal