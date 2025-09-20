# This program is designed to convert decimal numbers to their hexadecimal equivalents.
# It takes a decimal number as input and outputs the corresponding hexadecimal value.
# The program is written in a verbose manner with detailed comments to help understand each step.

# Function to convert a single digit to its hexadecimal representation
def digit_to_hex(digit)
    # Array of hexadecimal characters
    hex_chars = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F']
    # Return the corresponding hexadecimal character
    hex_chars[digit]
end

# Function to convert a decimal number to hexadecimal
def decimal_to_hex(decimal)
    # Initialize an empty string to store the hexadecimal result
    hex_result = ""
    # Variable to store the current decimal number being processed
    current_number = decimal

    # Loop until the entire decimal number is converted
    while current_number > 0
        # Calculate the remainder when the current number is divided by 16
        remainder = current_number % 16
        # Convert the remainder to its hexadecimal equivalent and prepend it to the result
        hex_result = digit_to_hex(remainder) + hex_result
        # Update the current number by dividing it by 16
        current_number = current_number / 16
    end

    # Return the final hexadecimal result
    hex_result
end

# Function to get user input and convert it to hexadecimal
def main
    # Prompt the user to enter a decimal number
    puts "Enter a decimal number to convert to hexadecimal:"
    # Read the user input and convert it to an integer
    decimal_input = gets.chomp.to_i

    # Call the conversion function and store the result
    hex_output = decimal_to_hex(decimal_input)

    # Display the hexadecimal result to the user
    puts "The hexadecimal equivalent is: #{hex_output}"
end

# Call the main function to start the program
main

