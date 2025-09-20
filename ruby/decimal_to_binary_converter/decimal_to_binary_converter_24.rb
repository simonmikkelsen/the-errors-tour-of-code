# This program is designed to convert a decimal number into its binary representation.
# It takes an integer input from the user and processes it to produce the corresponding binary output.
# The program is written in a verbose manner to help new programmers understand the flow of the code.

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
    
    # Return the final binary result
    binary_result
end

# Function to get user input
def get_user_input
    # Prompt the user to enter a decimal number
    puts "Enter a decimal number to convert to binary:"
    
    # Get the input from the user and convert it to an integer
    user_input = gets.chomp.to_i
    
    # Return the user input
    user_input
end

# Main function to execute the program
def main
    # Get the user input
    user_input = get_user_input
    
    # Convert the user input to binary
    binary_output = decimal_to_binary(user_input)
    
    # Display the binary output to the user
    puts "The binary representation of #{user_input} is: #{binary_output}"
end

# Call the main function to run the program
main

# Close the standard input stream (this is the subtle error)
STDIN.close

