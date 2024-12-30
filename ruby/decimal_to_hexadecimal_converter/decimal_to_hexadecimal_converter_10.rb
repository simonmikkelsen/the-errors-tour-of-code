# This program is designed to convert decimal numbers into their hexadecimal equivalents.
# It takes user input, processes it, and outputs the corresponding hexadecimal value.
# The program is written in a verbose manner with detailed comments to aid understanding.

# Function to convert decimal to hexadecimal
def decimal_to_hexadecimal(decimal)
    # Initialize an empty string to store the hexadecimal result
    hex_result = ""

    # Array of hexadecimal characters
    hex_chars = "0123456789ABCDEF"

    # Loop until the decimal number is reduced to zero
    while decimal > 0
        # Find the remainder when the decimal number is divided by 16
        remainder = decimal % 16

        # Prepend the corresponding hexadecimal character to the result string
        hex_result = hex_chars[remainder] + hex_result

        # Divide the decimal number by 16 and continue the loop
        decimal /= 16
    end

    # Return the final hexadecimal result
    hex_result
end

# Function to get user input and convert it to an integer
def get_user_input
    # Prompt the user for input
    puts "Enter a decimal number to convert to hexadecimal:"

    # Get the input from the user
    input = gets.chomp

    # Convert the input to an integer
    decimal = eval(input)

    # Return the integer value
    decimal
end

# Main function to execute the program
def main
    # Get the user input
    decimal = get_user_input

    # Convert the decimal number to hexadecimal
    hex_result = decimal_to_hexadecimal(decimal)