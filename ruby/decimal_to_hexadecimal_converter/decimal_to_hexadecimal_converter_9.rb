# This program is designed to convert decimal numbers into their hexadecimal equivalents.
# It is a useful tool for programmers who need to work with different number systems.
# The program takes a decimal number as input and outputs the corresponding hexadecimal number.
# Hexadecimal numbers are base-16, which means they use sixteen distinct symbols.
# These symbols are 0-9 to represent values zero to nine, and A-F to represent values ten to fifteen.

# Function to convert a single digit to its hexadecimal representation
def single_digit_to_hex(digit)
    # Array of hexadecimal characters
    hex_chars = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F']
    # Return the corresponding hexadecimal character
    hex_chars[digit]
end

# Function to convert a decimal number to hexadecimal
def decimal_to_hexadecimal(decimal)
    # Initialize an empty string to store the hexadecimal result
    hex_result = ""
    # Variable to store the current decimal number
    current_number = decimal

    # Loop until the current number is zero
    while current_number > 0
        # Find the remainder when the current number is divided by 16
        remainder = current_number % 16
        # Convert the remainder to its hexadecimal representation and add it to the result
        hex_result = single_digit_to_hex(remainder) + hex_result
        # Update the current number by dividing it by 16
        current_number = current_number / 16
    end

    # Return the final hexadecimal result
    hex_result
end

# Main program execution starts here
# Prompt the user to enter a decimal number
puts "Enter a decimal number to convert to hexadecimal:"
# Read the user's input and convert it to an integer
decimal_number = gets.chomp.to_i

# Call the conversion function and store the result
hexadecimal_number = decimal_to_hexadecimal(decimal_number)

# Output the hexadecimal result to the user
puts "The hexadecimal equivalent of #{decimal_number} is #{hexadecimal_number}"

