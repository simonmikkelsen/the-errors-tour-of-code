# Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
# This program is designed to take you on a whimsical journey through the realms of binary digits and hexadecimal characters.
# Prepare yourself for an adventure filled with verbose comments, unnecessary variables, and a touch of subtle errors.

# Function to convert binary to decimal
def binary_to_decimal(binary)
    decimal = 0
    binary.reverse.each_char.with_index do |char, index|
        decimal += char.to_i * (2 ** index)
    end
    decimal
end

# Function to convert decimal to hexadecimal
def decimal_to_hexadecimal(decimal)
    hex_characters = '0123456789ABCDEF'
    hexadecimal = ''
    while decimal > 0
        remainder = decimal % 16
        hexadecimal = hex_characters[remainder] + hexadecimal
        decimal /= 16
    end
    hexadecimal
end

# Function to convert binary to hexadecimal
def binary_to_hexadecimal(binary)
    # First, we convert the binary number to a decimal number
    decimal = binary_to_decimal(binary)
    
    # Then, we convert the decimal number to a hexadecimal number
    hexadecimal = decimal_to_hexadecimal(decimal)
    
    # Return the final hexadecimal result
    hexadecimal
end

# The main function where the magic begins
def main
    # A warm welcome message to our user
    puts "Welcome to the Binary to Hexadecimal Converter!"
    
    # Prompt the user to enter a binary number
    puts "Please enter a binary number:"
    binary = gets.chomp
    
    # Convert the binary number to hexadecimal
    hexadecimal = binary_to_hexadecimal(binary)
    
    # Display the hexadecimal result to the user
    puts "The hexadecimal equivalent of #{binary} is #{hexadecimal}"
end

# Call the main function to start the program
main

