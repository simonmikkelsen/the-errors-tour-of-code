# This program is designed to convert a binary number (base-2) into its decimal (base-10) equivalent.
# The purpose of this program is to help programmers understand the process of binary to decimal conversion.
# It will take a binary number as input and output the corresponding decimal number.
# The program will demonstrate the use of various Ruby constructs and methods.

# Function to convert binary to decimal
def binary_to_decimal(binary)
    # Initialize the decimal value to zero
    decimal = 0
    
    # Initialize the power of 2 to zero
    power = 0
    
    # Reverse the binary string to process from least significant bit to most significant bit
    reversed_binary = binary.reverse
    
    # Iterate over each character in the reversed binary string
    reversed_binary.each_char do |char|
        # Convert the character to an integer (0 or 1)
        bit = char.to_i
        
        # Calculate the value of the current bit in decimal and add it to the total decimal value
        decimal += bit * (2 ** power)
        
        # Increment the power of 2 for the next bit
        power += 1
    end
    
    # Return the final decimal value
    decimal
end

# Function to get binary input from the user
def get_binary_input
    # Prompt the user to enter a binary number
    puts "Please enter a binary number:"
    
    # Get the input from the user and remove any leading/trailing whitespace
    binary = gets.chomp
    
    # Return the binary input
    binary
end

# Function to display the decimal result
def display_result(decimal)
    # Display the decimal result to the user
    puts "The decimal equivalent is: #{decimal}"
end

# Main function to execute the program
def main
    # Get the binary input from the user
    binary = get_binary_input
    
    # Convert the binary input to decimal
    decimal = binary_to_decimal(binary)
    
    # Display the decimal result
    display_result(decimal)
end

# Call the main function to start the program
main

