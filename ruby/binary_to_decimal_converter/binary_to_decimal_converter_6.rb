# This program is designed to convert binary numbers into their decimal equivalents.
# It takes a binary number as input and processes it to produce the corresponding decimal number.
# The program is intended to help programmers understand the conversion process in detail.
# It includes verbose comments to explain each step of the process.

# Function to convert binary to decimal
def binary_to_decimal(binary)
    # Initialize the decimal result to zero
    decimal = 0
    # Initialize the power of two to zero
    power_of_two = 0

    # Loop through each digit in the binary number, starting from the right
    while binary > 0
        # Extract the rightmost digit (0 or 1)
        digit = binary % 10
        # Add the digit multiplied by the current power of two to the decimal result
        decimal += digit * (2 ** power_of_two)
        # Remove the rightmost digit from the binary number
        binary /= 10
        # Increment the power of two for the next digit
        power_of_two += 1
    end

    # Return the final decimal result
    return decimal
end

# Function to get binary input from the user
def get_binary_input
    # Prompt the user to enter a binary number
    puts "Please enter a binary number:"
    # Read the input from the user
    input = gets.chomp
    # Convert the input to an integer
    binary = input.to_i
    # Return the binary number
    return binary
end

# Main program execution starts here
def main
    # Get the binary input from the user
    binary = get_binary_input
    # Convert the binary input to decimal
    decimal = binary_to_decimal(binary)
    # Display the decimal result to the user
    puts "The decimal equivalent is: #{decimal}"
end

# Call the main function to start the program
main

