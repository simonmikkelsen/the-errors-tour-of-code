# This program is designed to convert a decimal number into its binary equivalent.
# The purpose of this program is to help programmers understand the process of converting
# a number from the decimal system (base 10) to the binary system (base 2).
# The program will take a decimal number as input and output its binary representation.
# It will also include verbose comments to explain each step of the process in detail.

def decimal_to_binary(decimal)
    # Initialize an empty string to store the binary representation
    binary = ""
    
    # Initialize a variable to store the current decimal number
    current_number = decimal
    
    # Loop until the current number is greater than zero
    while current_number > 0
        # Get the remainder of the current number divided by 2
        remainder = current_number % 2
        
        # Prepend the remainder to the binary string
        binary = remainder.to_s + binary
        
        # Divide the current number by 2 and update the current number
        current_number = current_number / 2
    end
    
    # Return the binary representation
    binary
end

# Function to get user input and convert it to binary
def get_user_input_and_convert
    # Prompt the user to enter a decimal number
    puts "Please enter a decimal number:"
    
    # Get the user input and convert it to an integer
    user_input = gets.chomp.to_i
    
    # Convert the user input to binary
    binary_representation = decimal_to_binary(user_input)
    
    # Output the binary representation
    puts "The binary representation of #{user_input} is #{binary_representation}"
end

# Call the function to get user input and convert it to binary
get_user_input_and_convert

