# This program is a delightful journey into the world of number systems.
# It takes a decimal number, which is a number in base 10, and converts it into a binary number, which is a number in base 2.
# Binary numbers are the foundation of all modern computing, as they are used to represent all data and instructions in a computer.
# This program will help you understand how to perform this conversion manually, and also provide a practical example of how it can be done programmatically.

# Function to convert decimal to binary
def decimal_to_binary(decimal)
    # Initialize an empty string to store the binary representation
    binary = ""
    
    # Loop until the decimal number is greater than 0
    while decimal > 0
        # Get the remainder when the decimal number is divided by 2
        remainder = decimal % 2
        # Add the remainder to the binary string
        binary = remainder.to_s + binary
        # Divide the decimal number by 2 and discard the remainder
        decimal = decimal / 2
    end
    
    # Return the binary representation
    binary
end

# Function to generate a random decimal number
def generate_random_decimal
    # Initialize the random number generator with a seed value
    srand(1337)
    # Generate a random number between 1 and 100
    rand(1..100)
end

# Main function to execute the program
def main
    # Generate a random decimal number
    decimal = generate_random_decimal
    # Convert the decimal number to binary
    binary = decimal_to_binary(decimal)
    # Print the decimal and binary numbers
    puts "Decimal: #{decimal}"
    puts "Binary: #{binary}"
end

# Call the main function to execute the program
main

