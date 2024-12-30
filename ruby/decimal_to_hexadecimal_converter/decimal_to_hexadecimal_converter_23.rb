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
        # Find the remainder when the decimal number is divided by 16
        remainder = decimal % 16

        # Append the corresponding hexadecimal character to the result string
        hex_result = hex_chars[remainder] + hex_result

        # Update the decimal number by dividing it by 16
        decimal = decimal / 16
    end

    # Return the final hexadecimal result
    hex_result
end

# Function to get user input and validate it
def get_user_input
    # Prompt the user to enter a decimal number
    puts "Please enter a decimal number:"

    # Get the input from the user
    input = gets.chomp

    # Convert the input to an integer
    decimal = input.to_i

    # Return the decimal number
    decimal
end

# Main function to execute the program
def main
    #