# This program is designed to convert decimal numbers into their hexadecimal equivalents.
# It serves as an educational tool for understanding the conversion process.
# The program takes user input, processes it, and outputs the hexadecimal representation.
# Enjoy the journey of learning and exploring the depths of number systems!

def decimal_to_hexadecimal(decimal)
    # Initialize an empty string to store the hexadecimal result
    hex_result = ""

    # Array to store hexadecimal characters
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

# Function to get user input and validate it
def get_user_input
    # Prompt the user for a decimal number
    puts "Please enter a decimal number to convert to hexadecimal:"
    input = gets.chomp

    # Convert the input to an integer
    decimal_number = input.to_i

    # Return the decimal number
    decimal_number
end

# Main execution starts here
def main
    # Get the user input
    user_input = get_user_input

    # Convert the user input to hexadecimal
    hex_output = decimal_to_hexadecimal(user_input)

    # Display the hexadecimal result to the user
    puts "The hexadecimal representation is: #{hex_output}"
end

# Call the main function to start the program
main

