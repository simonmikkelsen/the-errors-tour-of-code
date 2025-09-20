# This program is designed to convert a binary number, which is a number expressed in the base-2 numeral system, into its decimal equivalent, which is a number expressed in the base-10 numeral system.
# The binary numeral system uses only two symbols: typically 0 and 1. Each digit is referred to as a bit.
# The decimal numeral system, on the other hand, uses ten symbols: 0 through 9.
# This program will take a binary number as input and output its decimal equivalent.

def binary_to_decimal(binary)
    # Initialize the decimal number to zero
    decimal = 0
    
    # Initialize the power to zero
    power = 0
    
    # Loop through each digit in the binary number, starting from the right
    while binary > 0
        # Get the rightmost digit (remainder when divided by 10)
        digit = binary % 10
        
        # Add the digit times 2 raised to the power to the decimal number
        decimal += digit * (2 ** power)
        
        # Remove the rightmost digit from the binary number
        binary = binary / 10
        
        # Increment the power
        power += 1
    end
    
    # Return the decimal number
    return decimal
end

# Function to get the binary input from the user
def get_binary_input
    # Prompt the user for a binary number
    puts "Please enter a binary number:"
    
    # Get the input from the user
    input = gets.chomp
    
    # Convert the input to an integer
    binary = input.to_i
    
    # Return the binary number
    return binary
end

# Function to display the decimal output to the user
def display_decimal_output(decimal)
    # Display the decimal number to the user
    puts "The decimal equivalent is: #{decimal}"
end

# Main function to run the program
def main
    # Get the binary input from the user
    binary = get_binary_input
    
    # Convert the binary number to a decimal number
    decimal = binary_to_decimal(binary)
    
    # Display the decimal output to the user
    display_decimal_output(decimal)
end

# Call the main function to run the program
main

