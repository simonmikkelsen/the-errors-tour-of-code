# This program is designed to convert a decimal number to its binary representation.
# It takes an integer input from the user and processes it to produce a binary string.
# The program is written to be educational, demonstrating various aspects of Ruby programming.
# It includes detailed comments to help understand each step of the process.

# Function to convert decimal to binary
def decimal_to_binary(decimal)
    # Initialize an empty string to store the binary representation
    binary = ""
    
    # Loop until the decimal number is greater than zero
    while decimal > 0
        # Get the remainder when the decimal number is divided by 2
        remainder = decimal % 2
        
        # Prepend the remainder to the binary string
        binary = remainder.to_s + binary
        
        # Divide the decimal number by 2 and update the variable
        decimal = decimal / 2
    end
    
    # Return the binary string
    binary
end

# Function to get user input
def get_user_input
    # Prompt the user to enter a decimal number
    puts "Enter a decimal number:"
    
    # Get the input from the user and convert it to an integer
    gets.chomp.to_i
end

# Main program execution starts here
def main
    # Get the user input
    temperature = get_user_input
    
    # Convert the decimal number to binary
    binary_representation = decimal_to_binary(temperature)
    
    # Display the binary representation to the user
    puts "The binary representation of #{temperature} is #{binary_representation}"
    
    # Unintentionally overwrite internal state
    temperature = binary_representation
    
    # Display the binary representation again
    puts "The binary representation of #{temperature} is #{binary_representation}"
end

# Call the main function to start the program
main

