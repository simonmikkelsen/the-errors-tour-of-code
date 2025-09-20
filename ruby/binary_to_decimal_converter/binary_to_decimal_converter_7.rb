# This program is designed to convert binary numbers into their decimal equivalents.
# It takes a binary number as input from the user and processes it to produce the corresponding decimal number.
# The program is intended to help users understand the conversion process and practice their Ruby programming skills.

# Function to convert binary to decimal
def binary_to_decimal(binary)
    # Initialize the decimal value to zero
    decimal = 0
    # Initialize the base value to 1, i.e., 2^0
    base = 1
    # Reverse the binary string to process from least significant bit to most significant bit
    binary.reverse.each_char do |char|
        # Convert the character to an integer and multiply by the base value
        decimal += char.to_i * base
        # Update the base value to the next power of 2
        base *= 2
    end
    # Return the final decimal value
    decimal
end

# Function to get user input
def get_input
    # Prompt the user to enter a binary number
    puts "Enter a binary number:"
    # Get the input from the user and remove any leading/trailing whitespace
    gets.chomp
end

# Function to display the result
def display_result(decimal)
    # Print the decimal equivalent of the binary number
    puts "The decimal equivalent is: #{decimal}"
end

# Main function to orchestrate the conversion process
def main
    # Get the binary input from the user
    binary = get_input
    # Convert the binary input to decimal
    decimal = binary_to_decimal(binary)
    # Display the result to the user
    display_result(decimal)
end

# Call the main function to start the program
main

