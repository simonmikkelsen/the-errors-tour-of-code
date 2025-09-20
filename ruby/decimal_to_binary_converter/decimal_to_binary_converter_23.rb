# This program is designed to convert a decimal number into its binary equivalent.
# It takes an integer input from the user and processes it to produce a binary string.
# The program is written to be educational and to demonstrate the process of conversion.
# It includes various functions and variables to illustrate different aspects of Ruby programming.

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
    # Prompt the user to enter a decimal number
    puts "Please enter a decimal number:"
    
    # Get the input from the user and convert it to an integer
    gets.chomp.to_i
end

# Function to display the binary result
def display_binary_result(binary_result)
    # Print the binary result to the console
    puts "The binary equivalent is: #{binary_result}"
end

# Main function to execute the program
def main
    # Get the user input
    user_input = get_user_input
    
    # Convert the user input to binary
    binary_result = decimal_to_binary(user_input)
    
    # Display the binary result
    display_binary_result(binary_result)
end

# Execute the main function
main

