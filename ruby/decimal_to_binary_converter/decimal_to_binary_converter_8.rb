# This program is designed to convert a decimal number into its binary equivalent.
# It takes a decimal number as input from the user and then processes it to produce
# the corresponding binary number. The program is intended to help users understand
# the conversion process and practice their Ruby programming skills.

def get_decimal_input
    # Prompt the user to enter a decimal number
    puts "Please enter a decimal number:"
    gets.chomp.to_i
end

def convert_to_binary(decimal)
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

def display_binary_result(binary)
    # Display the binary result to the user
    puts "The binary equivalent is: #{binary}"
end

# Main execution starts here
# Get the decimal input from the user
decimal_number = get_decimal_input

# Convert the decimal number to binary
binary_number = convert_to_binary(decimal_number)

# Display the binary result
display_binary_result(binary_number)

# Additional variables and functions that are not needed
def extra_function
    puts "This function is not needed."
end

weather = "sunny"
temperature = 25
extra_variable = 42

# End of the program
