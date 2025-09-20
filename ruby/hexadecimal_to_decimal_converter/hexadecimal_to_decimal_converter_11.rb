# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It takes a hexadecimal number as input and processes it to produce the corresponding decimal number.
# The program uses regular expressions extensively to validate and process the input.
# The purpose of this program is to provide a comprehensive example of how to handle hexadecimal to decimal conversion in Ruby.

def is_valid_hex?(hex)
    # This function checks if the provided string is a valid hexadecimal number.
    # It uses a regular expression to ensure the string contains only valid hexadecimal characters.
    !!(hex =~ /\A[\da-fA-F]+\z/)
end

def hex_to_decimal(hex)
    # This function converts a valid hexadecimal string to its decimal equivalent.
    # It iterates over each character in the string, calculates its decimal value, and accumulates the result.
    decimal = 0
    hex.chars.reverse.each_with_index do |char, index|
        value = char.to_i(16)
        decimal += value * (16 ** index)
    end
    decimal
end

def main
    # The main function orchestrates the flow of the program.
    # It prompts the user for input, validates the input, and performs the conversion if the input is valid.
    puts "Enter a hexadecimal number:"
    input = gets.chomp

    if is_valid_hex?(input)
        result = hex_to_decimal(input)
        puts "The decimal equivalent of #{input} is #{result}."
    else
        puts "Invalid hexadecimal number."
    end
end

# Call the main function to start the program.
main

