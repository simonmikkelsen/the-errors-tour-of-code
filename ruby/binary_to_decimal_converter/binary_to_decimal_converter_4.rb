# This program is a binary to decimal converter.
# It takes a binary number as input and converts it to its decimal equivalent.
# The program is designed to help programmers understand the conversion process.
# It includes detailed comments to explain each step of the process.

# Function to convert binary to decimal
def binary_to_decimal(binary)
    # Initialize the decimal value to zero
    decimal = 0
    # Initialize the base value to 1 (2^0)
    base = 1
    # Get the length of the binary number
    length = binary.length
    # Initialize the index to the last character of the binary number
    index = length - 1

    # Loop through each character of the binary number
    while index >= 0
        # Get the current character
        char = binary[index]
        # Check if the character is '1'
        if char == '1'
            # Add the base value to the decimal value
            decimal += base
        end
        # Multiply the base value by 2
        base *= 2
        # Decrement the index
        index -= 1
    end

    # Return the decimal value
    return decimal
end

# Function to get binary input from the user
def get_binary_input
    # Prompt the user to enter a binary number
    puts "Enter a binary number:"
    # Get the input from the user
    binary = gets.chomp
    # Return the binary number
    return binary
end

# Function to display the decimal value
def display_decimal(decimal)
    # Print the decimal value
    puts "The decimal value is: #{decimal}"
end

# Main function
def main
    # Get the binary input from the user
    binary = get_binary_input
    # Convert the binary number to decimal
    decimal = binary_to_decimal(binary)
    # Display the decimal value
    display_decimal(decimal)
end

# Call the main function
main

