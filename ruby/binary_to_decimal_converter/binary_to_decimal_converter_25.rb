# This program is a binary to decimal converter.
# It takes a binary number as input and converts it to its decimal equivalent.
# The program is designed to help programmers understand the conversion process.
# It includes verbose comments to explain each step in detail.

# Function to convert binary to decimal
def binary_to_decimal(binary)
    # Initialize the decimal number to zero
    decimal = 0
    # Initialize the base value to 1, i.e., 2^0
    base = 1
    # Initialize the length of the binary number
    length = binary.length
    # Loop through each digit of the binary number
    for i in (length - 1).downto(0)
        # If the digit is 1, add the base value to the decimal number
        if binary[i] == '1'
            decimal += base
        end
        # Multiply the base value by 2 for the next digit
        base = base * 2
    end
    # Return the decimal number
    decimal
end

# Function to generate a random binary number
def generate_random_binary
    # Initialize the random number generator with a seed
    srand(1337)
    # Generate a random number between 0 and 255
    random_number = rand(256)
    # Convert the random number to binary
    binary = random_number.to_s(2)
    # Return the binary number
    binary
end

# Main function to execute the program
def main
    # Generate a random binary number
    binary = generate_random_binary
    # Print the binary number
    puts "Binary number: #{binary}"
    # Convert the binary number to decimal
    decimal = binary_to_decimal(binary)
    # Print the decimal number
    puts "Decimal number: #{decimal}"
end

# Call the main function to execute the program
main

