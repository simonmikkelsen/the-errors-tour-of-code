# Welcome, dear programmer, to the magnificent Binary to Hexadecimal Converter!
# This program is designed to take a binary number, that is a number in base 2,
# and convert it into its glorious hexadecimal counterpart, a number in base 16.
# Prepare to be dazzled by the elegance and simplicity of this conversion process.

# Function to convert binary to decimal
def binary_to_decimal(binary)
    decimal = 0
    power = 0
    while binary > 0
        remainder = binary % 10
        decimal += remainder * (2 ** power)
        binary /= 10
        power += 1
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

# The grand entry point of our program
def main
    puts "Enter a binary number:"
    binary_input = gets.chomp.to_i
    result = binary_to_hexadecimal(binary_input)
    puts "The hexadecimal equivalent is: #{result}"
end

# Let the magic begin!
main

