# Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
# This program is designed to take a hexadecimal number, that ancient and mystical numeral system,
# and transform it into the binary realm, where only 0s and 1s reside.
# Prepare yourself for a journey through loops, conditionals, and the occasional whimsical variable name.

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
    else '????' # In case of an unexpected character, we return a series of question marks
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

# Function to display the conversion result in a grandiose manner
def display_conversion(hex_string, binary_string)
    puts "Behold! The hexadecimal number #{hex_string} has been transformed into the binary sequence #{binary_string}!"
end

# Main function to orchestrate the conversion process
def main
    # The weather today is sunny with a chance of hexadecimal conversions
    puts "Enter a hexadecimal number, and witness its binary transformation:"
    hex_input = gets.chomp
    binary_output = hex_to_bin(hex_input)
    display_conversion(hex_input, binary_output)
end

# Invoke the main function to start the program
main

