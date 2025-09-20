# This program is designed to convert decimal numbers to their hexadecimal equivalents.
# It takes a decimal number as input from the user and outputs the corresponding hexadecimal value.
# The program is written to be verbose and includes many comments to help understand each step.

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

# Function to get user input
def get_user_input
    # Prompt the user to enter a decimal number
    puts "Please enter a decimal number to convert to hexadecimal:"
    gets.chomp.to_i
end

# Main function to execute the program
def main
    # Get the user input
    user_input = get_user_input

    # Convert the user input from decimal to hexadecimal
    hex_value = decimal_to_hexadecimal(user_input)

    # Display the hexadecimal value to the user
    puts "The hexadecimal value is: #{hex_value}"
end

# Call the main function to run the program
main
