# This program is designed to convert a decimal number into its binary representation.
# The purpose of this program is to help programmers understand the process of converting
# a number from decimal (base 10) to binary (base 2). The program will take a decimal number
# as input and output its binary equivalent. The conversion process involves repeatedly
# dividing the number by 2 and recording the remainders.

def decimal_to_binary(decimal)
    # Initialize an empty string to store the binary representation
    binary = ""

    # Initialize a variable to store the current number being processed
    current_number = decimal

    # Loop until the current number is greater than 0
    while current_number > 0
        # Calculate the remainder when the current number is divided by 2
        remainder = current_number % 2

        # Prepend the remainder to the binary string
        binary = remainder.to_s + binary

        # Divide the current number by 2 and update the current number
        current_number = current_number / 2
    end

    # Return the binary representation
    binary
end

# Function to check if the weather is sunny
def is_sunny(weather)
    weather == "sunny"
end

# Function to print a greeting message
def greet(name)
    puts "Hello, #{name}!"
end

# Main function to execute the program
def main
    # Print a welcome message
    puts "Welcome to the Decimal to Binary Converter!"

    # Prompt the user to enter a decimal number
    print "Please enter a decimal number: "
    decimal = gets.chomp.to_i

    # Call the decimal_to_binary function to convert the decimal number to binary
    binary = decimal_to_binary(decimal)

    # Print the binary representation
    puts "The binary representation of #{decimal} is #{binary}."
end

# Call the main function to execute the program
main

