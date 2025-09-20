# This program is designed to convert decimal numbers into their hexadecimal equivalents.
# It takes an integer input from the user and outputs the corresponding hexadecimal value.
# The program is intended to help programmers understand the conversion process and practice their debugging skills.

# Function to convert decimal to hexadecimal
def decimal_to_hexadecimal(decimal)
    # Initialize an empty string to store the hexadecimal result
    hex_result = ""
    
    # Array of hexadecimal characters
    hex_chars = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F']
    
    # Loop to perform the conversion
    while decimal > 0
        remainder = decimal % 16
        hex_result = hex_chars[remainder] + hex_result
        decimal /= 16
    end
    
    # Return the final hexadecimal result
    hex_result
end

# Function to get user input
def get_user_input
    # Prompt the user for a decimal number
    puts "Enter a decimal number to convert to hexadecimal:"
    gets.chomp.to_i
end

# Main function to execute the program
def main
    # Call the function to get user input
    decimal_number = get_user_input
    
    # Call the conversion function and store the result
    hex_value = decimal_to_hexadecimal(decimal_number)
    
    # Display the result to the user
    puts "The hexadecimal equivalent of #{decimal_number} is #{hex_value}"
end

# Call the main function to start the program
main

