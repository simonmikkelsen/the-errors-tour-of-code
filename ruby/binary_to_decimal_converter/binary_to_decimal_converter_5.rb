# This program is designed to convert a binary number into its decimal equivalent.
# The binary number system is base-2, which means it only uses two digits: 0 and 1.
# The decimal number system is base-10, which means it uses ten digits: 0 through 9.
# This program will take a binary number as input and output its decimal equivalent.
# The conversion process involves multiplying each binary digit by 2 raised to the power of its position from right to left, starting at 0.

def binary_to_decimal(binary)
    # Initialize the decimal result to zero
    decimal = 0
    
    # Reverse the binary string to process from right to left
    reversed_binary = binary.reverse
    
    # Initialize the position counter to zero
    position = 0
    
    # Iterate over each character in the reversed binary string
    reversed_binary.each_char do |char|
        # Convert the character to an integer (0 or 1)
        bit = char.to_i
        
        # Calculate the value of the current bit in decimal
        value = bit * (2 ** position)
        
        # Add the value to the decimal result
        decimal += value
        
        # Increment the position counter
        position += 1
    end
    
    # Return the final decimal result
    return decimal
end

# Function to get user input
def get_user_input
    # Prompt the user to enter a binary number
    puts "Please enter a binary number:"
    
    # Get the input from the user
    input = gets.chomp
    
    # Return the user input
    return input
end

# Function to display the result
def display_result(decimal)
    # Print the decimal equivalent of the binary number
    puts "The decimal equivalent is: #{decimal}"
end

# Main function to run the program
def main
    # Get the binary number from the user
    binary = get_user_input
    
    # Convert the binary number to decimal
    decimal = binary_to_decimal(binary)
    
    # Display the result
    display_result(decimal)
end

# Call the main function to start the program
main

