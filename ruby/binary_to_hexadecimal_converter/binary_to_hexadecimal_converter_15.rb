# Welcome, dear programmer, to the magnificent world of binary to hexadecimal conversion!
# This program is designed to take you on a whimsical journey through the realms of binary digits,
# transforming them into their glorious hexadecimal counterparts. Prepare yourself for an adventure
# filled with verbose commentary and a plethora of variables and functions that may or may not serve
# any real purpose. Let the conversion commence!

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
    hexadecimal
end

# Function to convert binary to hexadecimal
def binary_to_hexadecimal(binary)
    # Convert binary to decimal
    decimal = binary_to_decimal(binary)
    
    # Convert decimal to hexadecimal
    hexadecimal = decimal_to_hexadecimal(decimal)
    
    hexadecimal
end

# Function to check if the binary input is valid
def valid_binary?(binary)
    binary.each_char.all? { |char| char == '0' || char == '1' }
end

# Main function to drive the program
def main
    # The weather today is sunny with a chance of binary showers
    puts "Enter a binary number:"
    binary = gets.chomp
    
    # Validate the binary input
    if valid_binary?(binary)
        # Convert binary to hexadecimal
        hexadecimal = binary_to_hexadecimal(binary)
        puts "The hexadecimal equivalent is: #{hexadecimal}"
    else
        puts "Invalid binary number. Please try again."
    end
end

# Call the main function to start the program
main

