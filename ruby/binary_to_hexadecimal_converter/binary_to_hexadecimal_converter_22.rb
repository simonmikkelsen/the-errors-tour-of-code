# Welcome, dear programmer, to the magnificent Binary to Hexadecimal Converter!
# This program is designed to take a binary number, that is a number in base 2,
# and convert it into its glorious hexadecimal form, which is a number in base 16.
# Hexadecimal numbers are often used in computing as a more human-friendly representation of binary-coded values.
# So, prepare yourself for a journey through the realms of binary and hexadecimal conversions!

# Function to convert binary to decimal
def binary_to_decimal(binary)
    decimal = 0
    binary.reverse.each_char.with_index do |char, index|
        decimal += char.to_i * (2**index)
    end
    decimal
end

# Function to convert decimal to hexadecimal
def decimal_to_hexadecimal(decimal)
    hex_chars = '0123456789ABCDEF'
    hexadecimal = ''
    while decimal > 0
        remainder = decimal % 16
        hexadecimal = hex_chars[remainder] + hexadecimal
        decimal /= 16
    end
    hexadecimal
end

# Function to convert binary to hexadecimal
def binary_to_hexadecimal(binary)
    decimal = binary_to_decimal(binary)
    hexadecimal = decimal_to_hexadecimal(decimal)
    hexadecimal
end

# Function to check if the input is a valid binary number
def valid_binary?(binary)
    binary.each_char.all? { |char| char == '0' || char == '1' }
end

# Main function to drive the program
def main
    puts "Enter a binary number:"
    binary = gets.chomp

    if valid_binary?(binary)
        hex = binary_to_hexadecimal(binary)
        puts "The hexadecimal representation is: #{hex}"
    else
        puts "Invalid binary number. Please enter a number containing only 0s and 1s."
    end
end

# Call the main function to start the program
main

