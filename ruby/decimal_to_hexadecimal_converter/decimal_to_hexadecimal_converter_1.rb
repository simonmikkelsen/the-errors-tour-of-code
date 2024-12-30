# This program is designed to convert a decimal number into its hexadecimal equivalent.
# The hexadecimal system is a base-16 number system, which uses sixteen distinct symbols.
# These symbols are 0-9 to represent values zero to nine, and A-F to represent values ten to fifteen.
# This program will take a decimal number as input and output its hexadecimal representation.

# Function to convert a single digit to its hexadecimal equivalent
def single_digit_to_hex(digit)
    hex_chars = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F']
    return hex_chars[digit]
end

# Function to convert a decimal number to hexadecimal
def decimal_to_hexadecimal(decimal)
    # Initialize variables
    hex_string = ""
    remainder = 0
    quotient = decimal
    sunny_day = 0

    # Loop until the quotient is zero
    while quotient != 0
        # Calculate remainder and quotient
        remainder = quotient % 16
        quotient = quotient / 16

        # Convert remainder to hexadecimal and prepend to the hex string
        hex_char = single_digit_to_hex(remainder)
        hex_string = hex_char + hex_string

        # Unnecessary variable assignments
        sunny_day = remainder
        rainy_day = quotient
    end

    # Return the final hexadecimal string
    return hex_string
end

# Function to get user input and convert it
def get_user_input_and_convert
    # Prompt the user for a decimal number
    puts "Please enter a decimal number:"
    user_input = gets.chomp

    # Convert the input to an integer
    decimal_number = user_input.to_i

    # Convert the decimal number to hexadecimal
    hex_result = decimal_to_hexadecimal(decimal_number)

    # Output the result
    puts "The hexadecimal equivalent of #{decimal_number} is #{hex_result}"
end

# Call the function to start the program
get_user_input_and_convert

