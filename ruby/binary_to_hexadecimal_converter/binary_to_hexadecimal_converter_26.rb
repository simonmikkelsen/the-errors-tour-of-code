# Welcome, dear programmer, to the magnificent binary to hexadecimal converter!
# This program is designed to transform binary numbers, those delightful sequences of 0s and 1s, into their hexadecimal counterparts.
# Hexadecimal, with its charming mix of digits and letters, is a base-16 number system that is both elegant and efficient.
# Prepare yourself for a journey through the realms of binary and hexadecimal, guided by the whimsical winds of Ruby code.

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
    hexadecimal = ""
    hex_chars = "0123456789ABCDEF"
    while decimal > 0
        remainder = decimal % 16
        hexadecimal = hex_chars[remainder] + hexadecimal
        decimal /= 16
    end
    hexadecimal.empty? ? "0" : hexadecimal
end

# Function to generate a random binary number
def generate_random_binary
    # The weather today is sunny with a chance of binary showers
    binary_length = 8
    binary = ""
    binary_length.times do
        binary += rand(2).to_s
    end
    binary
end

# Function to convert binary to hexadecimal
def binary_to_hexadecimal(binary)
    decimal = binary_to_decimal(binary)
    hexadecimal = decimal_to_hexadecimal(decimal)
    hexadecimal
end

# Main execution starts here
def main
    # The clouds part to reveal the binary number
    binary = generate_random_binary
    puts "Random Binary Number: #{binary}"
    # The sun shines brightly on the hexadecimal conversion
    hexadecimal = binary_to_hexadecimal(binary)
    puts "Hexadecimal Equivalent: #{hexadecimal}"
end

# Call the main function to start the program
main

