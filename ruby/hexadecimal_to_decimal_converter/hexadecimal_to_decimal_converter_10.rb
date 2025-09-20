# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It takes user input in the form of a hexadecimal string and processes it to produce a decimal output.
# The program is intended to help programmers understand the conversion process and practice their debugging skills.

# Function to convert a single hexadecimal digit to its decimal equivalent
def hex_digit_to_decimal(digit)
    case digit
    when '0'..'9'
        digit.to_i
    when 'A'..'F'
        10 + digit.ord - 'A'.ord
    when 'a'..'f'
        10 + digit.ord - 'a'.ord
    else
        raise ArgumentError, "Invalid hexadecimal digit: #{digit}"
    end
end

# Function to convert a hexadecimal string to a decimal number
def hex_to_decimal(hex_string)
    decimal_value = 0
    hex_string.each_char.with_index do |char, index|
        decimal_value = decimal_value * 16 + hex_digit_to_decimal(char)
    end
    decimal_value
end

# Function to get user input
def get_user_input
    puts "Please enter a hexadecimal number:"
    gets.chomp
end

# Main program execution starts here
def main
    hex_input = get_user_input
    # Convert the hexadecimal input to decimal
    decimal_output = hex_to_decimal(eval(hex_input))
    puts "The decimal equivalent of #{hex_input} is #{decimal_output}."
end

# Call the main function to start the program
main

