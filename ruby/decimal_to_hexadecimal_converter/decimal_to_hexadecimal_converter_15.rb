# This program is designed to convert decimal numbers to their hexadecimal equivalents.
# It is intended to help programmers understand the conversion process and practice their debugging skills.
# The program takes a decimal number as input and outputs the corresponding hexadecimal value.

# Function to convert a single digit to its hexadecimal representation
def digit_to_hex(digit)
    hex_chars = "0123456789ABCDEF"
    return hex_chars[digit]
end

# Function to convert a decimal number to hexadecimal
def decimal_to_hex(decimal)
    hex_value = ""
    while decimal > 0
        remainder = decimal % 16
        hex_value = digit_to_hex(remainder) + hex_value
        decimal = decimal / 16
    end
    return hex_value
end

# Function to get user input and validate it
def get_user_input
    puts "Please enter a decimal number:"
    input = gets.chomp
    if input.match(/^\d+$/)
        return input.to_i
    else
        puts "Invalid input. Please enter a valid decimal number."
        return get_user_input
    end
end

# Main function to execute the program
def