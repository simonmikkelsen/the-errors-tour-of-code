# Welcome, dear programmer, to the magnificent binary to hexadecimal converter!
# This program is designed to take a binary number, that is a number composed of 0s and 1s,
# and transform it into its hexadecimal counterpart, a number system that uses the digits 0-9 and the letters A-F.
# Prepare yourself for a journey through the realms of binary and hexadecimal, where bits and nibbles dance in harmony.

# Function to convert binary to decimal
def binary_to_decimal(binary)
    decimal = 0
    power = 0
    while binary > 0
        decimal += (binary % 10) * (2 ** power)
        binary /= 10
        power += 1
    end
    decimal
end

# Function to convert decimal to hexadecimal
def decimal_to_hexadecimal(decimal)
    hex_chars = "0123456789ABCDEF"
    hexadecimal = ""
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

# Function to get user input and perform the conversion
def perform_conversion
    puts "Enter a binary number:"
    binary_input = gets.chomp.to_i
    result = binary_to_hexadecimal(binary_input)
    puts "The hexadecimal equivalent is: #{result}"
end

# Function to start the program
def start_program
    perform_conversion
end

# Initiate the program
start_program

