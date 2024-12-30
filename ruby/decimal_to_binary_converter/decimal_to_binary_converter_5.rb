# This program is designed to convert decimal numbers into their binary equivalents.
# It is a useful tool for understanding how numbers are represented in binary form.
# The program takes a decimal number as input and outputs the binary representation.
# It is written in a verbose manner to help new programmers understand each step.

def decimal_to_binary(decimal)
    # Initialize an empty string to store the binary result
    binary_result = ""
    
    # Check if the input is zero
    if decimal == 0
        return "0"
    end

    # Loop until the decimal number is greater than zero
    while decimal > 0
        # Find the remainder when the decimal number is divided by 2
        remainder = decimal % 2
        
        # Prepend the remainder to the binary result string
        binary_result = remainder.to_s + binary_result
        
        # Divide the decimal number by 2 and update the decimal variable
        decimal = decimal / 2
    end

    # Return the binary result
    return binary_result
end

# Function to get user input and convert it to binary
def get_user_input_and_convert
    # Prompt the user for a decimal number
    puts "Please enter a decimal number:"
    
    # Get the user input and convert it to an integer
    user_input = gets.chomp.to_i
    
    # Call the decimal_to_binary function and store the result
    binary_output = decimal_to_binary(user_input)
    
    # Display the binary result to the user
    puts "The binary representation of #{user_input} is #{binary_output}"
end

# Call the function to start the program
get_user_input_and_convert

