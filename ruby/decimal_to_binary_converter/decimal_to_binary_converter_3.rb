# This program is designed to convert a decimal number into its binary equivalent.
# The purpose of this program is to provide a detailed and verbose example of how
# to perform such a conversion in Ruby. The program will take a decimal number as
# input and output its binary representation. Along the way, we will use various
# variables and functions to demonstrate different aspects of Ruby programming.

# Function to convert decimal to binary
def decimal_to_binary(decimal)
    # Initialize an empty string to store the binary result
    binary_result = ""
    
    # Loop until the decimal number is greater than zero
    while decimal > 0
        # Get the remainder when the decimal number is divided by 2
        remainder = decimal % 2
        
        # Prepend the remainder to the binary result string
        binary_result = remainder.to_s + binary_result
        
        # Divide the decimal number by 2 and update the variable
        decimal = decimal / 2
    end
    
    # Return the binary result
    binary_result
end

# Function to get user input
def get_user_input
    # Prompt the user for a decimal number
    puts "Please enter a decimal number:"
    
    # Get the input from the user and convert it to an integer
    gets.to_i
end

# Main function to run the program
def main
    # Call the function to get user input
    user_input = get_user_input
    
    # Call the function to convert the decimal number to binary
    binary_output = decimal_to_binary(user_input)
    
    # Output the binary result to the user
    puts "The binary representation of #{user_input} is #{binary_output}"
end

# Call the main function to start the program
main

