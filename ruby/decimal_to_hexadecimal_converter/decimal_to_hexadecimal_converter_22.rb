# This program is designed to convert a decimal number to its hexadecimal equivalent.
# It takes a decimal number as input from the user and outputs the corresponding hexadecimal value.
# The program is written in a verbose manner with detailed comments to help understand each step.

# Function to convert decimal to hexadecimal
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
    user_input = gets.chomp

    # Validate the user input to ensure it is a valid decimal number
    if user_input.match?(/^\d+$/)
        user_input.to_i
    else
        puts "Invalid input. Please enter a valid decimal number."
        exit
    end
end

# Main function to execute the program
def main
    # Get the user input
    decimal_number = get_user_input

    # Convert the decimal number to hexadecimal
    hex_value =