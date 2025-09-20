# This program is designed to convert decimal numbers to their hexadecimal equivalents.
# It takes user input, processes the input, and outputs the corresponding hexadecimal value.
# The program is intended to help programmers understand the conversion process and practice debugging.

# Function to convert a single digit to its hexadecimal representation
def digit_to_hex(digit)
    hex_digits = "0123456789ABCDEF"
    hex_digits[digit]
end

# Function to convert a decimal number to hexadecimal
def decimal_to_hex(decimal)
    hex_value = ""
    while decimal > 0
        remainder = decimal % 16
        hex_value = digit_to_hex(remainder) + hex_value
        decimal /= 16
    end
    hex_value
end

# Function to get user input and validate it
def get_user_input
    puts "Enter a decimal number to convert to hexadecimal:"
    input = gets.chomp
    if input.match?(/^\d+$/)
        input.to_i
    else
        puts "Invalid input. Please enter a valid decimal number."
        get_user_input
    end
end

# Main program execution starts here
def main
    temperature = get_user_input
    hex_result = decimal_to_hex(temperature)
    puts "The hexadecimal equivalent is: #{hex_result}"
end

# Call the main function to start the program
main

