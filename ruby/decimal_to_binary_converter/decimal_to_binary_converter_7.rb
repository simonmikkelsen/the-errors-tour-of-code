# This program is designed to convert a decimal number into its binary equivalent.
# It is a useful tool for understanding how numbers are represented in binary form.
# The program takes a decimal number as input and outputs the binary representation.
# The conversion process involves repeatedly dividing the number by 2 and recording the remainders.
# These remainders are then used to construct the binary number.

def decimal_to_binary(decimal)
    # Initialize an empty string to store the binary representation
    binary = ""
    
    # Check if the input is zero
    if decimal == 0
        return "0"
    end

    # Loop until the decimal number is greater than zero
    while decimal > 0
        # Calculate the remainder when the decimal number is divided by 2
        remainder = decimal % 2
        
        # Prepend the remainder to the binary string
        binary = remainder.to_s + binary
        
        # Divide the decimal number by 2 and update the variable
        decimal = decimal / 2
    end

    # Return the binary representation
    return binary
end

# Function to get user input and call the conversion function
def get_user_input
    # Prompt the user for a decimal number
    puts "Enter a decimal number:"
    
    # Read the input from the user
    input = gets.chomp
    
    # Convert the input to an integer
    decimal = input.to_i
    
    # Call the conversion function and store the result
    binary = decimal_to_binary(decimal)
    
    # Output the binary representation
    puts "The binary representation of #{decimal} is #{binary}"
end

# Call the function to start the program
get_user_input

