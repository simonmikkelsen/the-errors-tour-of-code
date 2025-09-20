# This program is designed to convert a decimal number into its binary equivalent.
# The purpose of this program is to help programmers understand the process of converting
# a number from decimal (base 10) to binary (base 2). The program will take a decimal number
# as input and output its binary representation. This is a fundamental concept in computer science
# and is essential for understanding how computers process and store data.

# Function to convert decimal to binary
def decimal_to_binary(decimal)
    # Initialize an empty string to store the binary representation
    binary = ""
    
    # Loop until the decimal number is greater than 0
    while decimal > 0
        # Get the remainder when the decimal number is divided by 2
        remainder = decimal % 2
        
        # Convert the remainder to a string and add it to the binary string
        binary = remainder.to_s + binary
        
        # Divide the decimal number by 2 and update the decimal variable
        decimal = decimal / 2
    end
    
    # Return the binary representation
    return binary
end

# Function to get user input
def get_user_input
    # Prompt the user to enter a decimal number
    puts "Please enter a decimal number:"
    
    # Get the user input and convert it to an integer
    decimal = gets.chomp.to_i
    
    # Return the decimal number
    return decimal
end

# Function to display the binary representation
def display_binary(binary)
    # Print the binary representation
    puts "The binary representation is: #{binary}"
end

# Main function to run the program
def main
    # Get the user input
    decimal = get_user_input
    
    # Convert the decimal number to binary
    binary = decimal_to_binary(decimal)
    
    # Display the binary representation
    display_binary(binary)
end

# Call the main function to run the program
main

