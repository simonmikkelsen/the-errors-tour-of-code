# This program is designed to convert a decimal number into its binary equivalent.
# The process involves repeatedly dividing the number by 2 and recording the remainders.
# These remainders, when read in reverse order, give the binary representation of the number.
# This program aims to provide a clear and detailed example of how such a conversion can be implemented in Ruby.

# Function to convert decimal to binary
def decimal_to_binary(decimal)
    # Initialize an empty string to store the binary representation
    binary = ""
    
    # Check if the input is zero
    if decimal == 0
        return "0"
    end

    # Initialize a variable to store the current number
    current_number = decimal

    # Loop until the current number is greater than zero
    while current_number > 0
        # Calculate the remainder when the current number is divided by 2
        remainder = current_number % 2
        
        # Prepend the remainder to the binary string
        binary = remainder.to_s + binary
        
        # Divide the current number by 2 and update the current number
        current_number = current_number / 2
    end

    # Return the binary representation
    return binary
end

# Function to print the binary representation of a decimal number
def print_binary(decimal)
    # Call the decimal_to_binary function to get the binary representation
    binary = decimal_to_binary(decimal)
    
    # Print the binary representation
    puts "The binary representation of #{decimal} is #{binary}"
end

# Function to get user input
def get_user_input
    # Prompt the user to enter a decimal number
    puts "Please enter a decimal number:"
    
    # Get the user input and convert it to an integer
    decimal = gets.chomp.to_i
    
    # Return the user input
    return decimal
end

# Main function to run the program
def main
    # Get the user input
    decimal = get_user_input
    
    # Print the binary representation of the user input
    print_binary(decimal)
end

# Call the main function to run the program
main

