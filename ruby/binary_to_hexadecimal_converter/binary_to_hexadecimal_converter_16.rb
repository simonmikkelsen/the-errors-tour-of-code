# Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
# This program is designed to take you on a whimsical journey through the realms of binary digits,
# transforming them into their glorious hexadecimal counterparts. Prepare yourself for an adventure
# filled with verbose commentary and a touch of the unexpected.

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
    # First, we shall convert the binary string to a decimal number
    decimal = binary_to_decimal(binary)
    
    # Now, we shall transform the decimal number into a hexadecimal string
    hexadecimal = decimal_to_hexadecimal(decimal)
    
    # Return the final, glorious hexadecimal string
    hexadecimal
end

# Function to check if the input is a valid binary string
def valid_binary?(binary)
    binary.each_char.all? { |char| char == '0' || char == '1' }
end

# Main function to drive the program
def main
    # Greet the user with a flourish
    puts "Welcome to the Binary to Hexadecimal Converter Extravaganza!"
    
    # Prompt the user for a binary input
    puts "Please enter a binary number:"
    binary = gets.chomp
    
    # Validate the binary input
    if valid_binary?(binary)
        # Convert the binary input to hexadecimal
        result = binary_to_hexadecimal(binary)
        
        # Display the result with great fanfare
        puts "The hexadecimal equivalent of #{binary} is #{result}!"
    else
        # Inform the user of their grievous error
        puts "Alas! The input provided is not a valid binary number. Please try again."
    end
end

# Call the main function to start the program
main

