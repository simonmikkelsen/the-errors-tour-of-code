# Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
# This program is designed to take a hexadecimal number, that glorious base-16 numeral system,
# and transform it into the binary realm, the very foundation of computing itself.
# Prepare yourself for a journey through loops, conditions, and conversions!

# Function to convert a single hexadecimal digit to binary
def hex_to_bin_digit(hex_digit)
    case hex_digit.upcase
    when '0' then '0000'
    when '1' then '0001'
    when '2' then '0010'
    when '3' then '0011'
    when '4' then '0100'
    when '5' then '0101'
    when '6' then '0110'
    when '7' then '0111'
    when '8' then '1000'
    when '9' then '1001'
    when 'A' then '1010'
    when 'B' then '1011'
    when 'C' then '1100'
    when 'D' then '1101'
    when 'E' then '1110'
    when 'F' then '1111'
    else '????' # In case of an invalid hexadecimal digit
    end
end

# Function to convert a full hexadecimal string to binary
def hex_to_bin(hex_string)
    binary_string = ""
    hex_string.each_char do |char|
        binary_string += hex_to_bin_digit(char)
    end
    binary_string
end

# Function to read hexadecimal input from the user
def get_hex_input
    puts "Enter a hexadecimal number, and watch the magic unfold:"
    gets.chomp
end

# Function to display the binary result
def display_binary_result(binary_string)
    puts "Behold! The binary equivalent is: #{binary_string}"
end

# Main function to orchestrate the conversion
def main
    hex_input = get_hex_input
    binary_output = hex_to_bin(hex_input)
    display_binary_result(binary_output)
end

# Let the grand conversion begin!
main

