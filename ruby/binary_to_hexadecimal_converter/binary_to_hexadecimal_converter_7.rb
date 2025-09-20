# Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
# This program is designed to take you on a whimsical journey through the realms of binary digits,
# transforming them into their glorious hexadecimal counterparts. Prepare yourself for an adventure
# filled with verbose explanations, unnecessary variables, and a touch of mystery.

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
    # First, we convert the binary number to its decimal form
    decimal = binary_to_decimal(binary)
    
    # Then, we convert the decimal number to its hexadecimal form
    hexadecimal = decimal_to_hexadecimal(decimal)
    
    # Return the final hexadecimal result
    hexadecimal
end

# Main program execution starts here
def main
    # The user is prompted to enter a binary number
    puts "Enter a binary number:"
    binary_input = gets.chomp.to_i
    
    # The binary number is converted to hexadecimal
    hex_output = binary_to_hexadecimal(binary_input)
    
    # The hexadecimal result is displayed to the user
    puts "The hexadecimal equivalent is: #{hex_output}"
end

# Call the main function to start the program
main

