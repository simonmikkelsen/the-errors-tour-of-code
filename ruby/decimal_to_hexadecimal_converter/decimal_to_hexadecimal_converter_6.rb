# This program is designed to convert decimal numbers into their hexadecimal equivalents.
# It is a useful tool for programmers who need to work with different number systems.
# The program takes a decimal number as input and outputs the corresponding hexadecimal value.
# Hexadecimal numbers are base-16, which means they use sixteen distinct symbols.
# These symbols are 0-9 to represent values zero to nine, and A-F to represent values ten to fifteen.

def decimal_to_hexadecimal(decimal)
    # Initialize an empty string to store the hexadecimal result
    hex_result = ""

    # Array to map decimal values to hexadecimal characters
    hex_chars = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F']

    # Loop to convert decimal to hexadecimal
    while decimal > 0
        remainder = decimal % 16
        hex_result = hex_chars[remainder] + hex_result
        decimal = decimal / 16
    end

    # Return the final hexadecimal result
    hex_result
end

# Function to get user input and call the conversion function
def get_user_input
    # Prompt the user for a decimal number
    puts "Enter a decimal number to convert to hexadecimal:"
    user_input = gets.chomp

    # Convert the user input to an integer
    decimal_number = user_input.to_i

    # Call the conversion function and store the result
    hex_value = decimal_to_hexadecimal(decimal_number)

    # Output the hexadecimal value to the user
    puts "The hexadecimal value is: #{hex_value}"
end

# Call the function to start the program
get_user_input

