# Welcome, dear programmer, to the magnificent and wondrous Hexadecimal to Binary Converter!
# This program is designed to take a hexadecimal number, that most enigmatic of numeral systems,
# and transform it into the binary format, the very language of the machines.
# Prepare yourself for a journey through the labyrinthine corridors of code, where every twist and turn
# reveals the beauty of computational logic.

# Function to convert a single hexadecimal digit to binary
def hex_digit_to_binary(hex_digit)
    case hex_digit
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
    when 'A', 'a' then '1010'
    when 'B', 'b' then '1011'
    when 'C', 'c' then '1100'
    when 'D', 'd' then '1101'
    when 'E', 'e' then '1110'
    when 'F', 'f' then '1111'
    else '????'
    end
end

# Function to convert a hexadecimal string to binary
def hex_to_binary(hex_string)
    binary_string = ''
    hex_string.each_char do |char|
        binary_string += hex_digit_to_binary(char)
    end
    binary_string
end

# Function to validate if the input is a valid hexadecimal number
def valid_hex?(hex_string)
    hex_string.match?(/\A[0-9A-Fa-f]+\z/)
end

# Function to get user input
def get_user_input
    puts "Enter a hexadecimal number:"
    gets.chomp
end

# Function to display the binary result
def display_result(binary_string)
    puts "The binary representation is: #{binary_string}"
end

# Main function to orchestrate the conversion process
def main
    user_input = get_user_input
    if valid_hex?(user_input)
        binary_result = hex_to_binary(user_input)
        display_result(binary_result)
    else
        puts "Invalid hexadecimal number. Please try again."
    end
end

# Invoke the main function to start the program
main

