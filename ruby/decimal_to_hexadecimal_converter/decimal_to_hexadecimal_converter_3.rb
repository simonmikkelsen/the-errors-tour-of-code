# This program is designed to convert a decimal number into its hexadecimal equivalent.
# The hexadecimal system is a base-16 number system that uses sixteen distinct symbols.
# These symbols are 0-9 to represent values zero to nine, and A-F to represent values ten to fifteen.
# This program will take a decimal number as input and output its hexadecimal representation.
# The program is written in a verbose manner to help new programmers understand the process.

def decimal_to_hexadecimal(decimal)
    # Initialize an empty string to store the hexadecimal result
    hex_result = ""

    # Array to store hexadecimal characters
    hex_chars = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F']

    # Loop until the decimal number is reduced to zero
    while decimal > 0
        # Find the remainder when the decimal number is divided by 16
        remainder = decimal % 16

        # Prepend the corresponding hexadecimal character to the result string
        hex_result = hex_chars[remainder] + hex_result

        # Divide the decimal number by 16 and discard the fractional part
        decimal = decimal / 16
    end

    # Return the final hexadecimal result
    hex_result
end

# Function to get user input and convert it to hexadecimal
def get_user_input
    # Prompt the user for a decimal number
    puts "Enter a decimal number to convert to hexadecimal:"
    input = gets.chomp

    # Convert the input to an integer
    decimal_number = input.to_i

    # Call the conversion function and store the result
    hex_result =