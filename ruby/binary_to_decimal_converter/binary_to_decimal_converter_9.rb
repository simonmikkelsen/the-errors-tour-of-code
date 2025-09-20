# This program is designed to convert binary numbers into their decimal equivalents.
# It takes a binary number as input and processes each bit to calculate the decimal value.
# The program showcases the use of various Ruby constructs and provides an opportunity to understand binary to decimal conversion.

# Function to convert binary to decimal
def binary_to_decimal(binary)
    # Initialize the decimal value to zero
    decimal = 0
    # Get the length of the binary string
    length = binary.length
    # Initialize the index for iteration
    index = 0

    # Iterate over each bit in the binary string
    while index < length
        # Get the current bit (0 or 1)
        bit = binary[index].to_i
        # Calculate the power of 2 for the current bit position
        power = length - index - 1
        # Add the value of the current bit to the decimal value
        decimal += bit * (2 ** power)
        # Increment the index
        index += 1
    end

    # Return the calculated decimal value
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
    # Print the decimal value
    puts "The decimal value is: #{decimal}"
end

# Main function to execute the program
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

