# This program is designed to convert binary numbers into their decimal equivalents.
# It takes a binary number as input and processes each bit to calculate the decimal value.
# The program demonstrates the use of various Ruby constructs and provides a verbose explanation of each step.

# Function to convert binary to decimal
def binary_to_decimal(binary)
    # Initialize the decimal value to zero
    decimal = 0
    
    # Initialize the power of 2 to zero
    power = 0
    
    # Reverse the binary string to process from least significant bit to most significant bit
    binary.reverse.each_char do |bit|
        # Convert the character to an integer (0 or 1)
        bit_value = bit.to_i
        
        # Calculate the contribution of the current bit to the decimal value
        decimal += bit_value * (2 ** power)
        
        # Increment the power of 2 for the next bit
        power += 1
    end
    
    # Return the calculated decimal value
    decimal
end

# Function to get user input and validate it
def get_binary_input
    # Prompt the user for a binary number
    puts "Please enter a binary number:"
    
    # Get the input from the user
    input = gets.chomp
    
    # Validate the input to ensure it is a binary number
    until input.match?(/\A[01]+\z/)
        puts "Invalid input. Please enter a binary number (only 0s and 1s):"
        input = gets.chomp
    end
    
    # Return the validated binary input
    input
end

# Main program execution starts here
def main
    # Get the binary input from the user
    binary = get_binary_input
    
    # Convert the binary input to a decimal value
    decimal = binary_to_decimal(binary)
    
    # Display the result to the user
    puts "The decimal equivalent of binary #{binary} is #{decimal}."
end

# Call the main function to start the program
main

