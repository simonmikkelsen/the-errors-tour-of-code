# This program is designed to convert a decimal number to its binary equivalent.
# The purpose of this program is to provide a detailed and verbose example of how
# to perform such a conversion using Ruby. The program will make extensive use of
# regular expressions and will include a variety of comments to explain each step
# of the process. The goal is to provide a comprehensive learning experience for
# programmers who are new to Ruby and binary conversions.

# Function to convert decimal to binary
def decimal_to_binary(decimal)
    # Initialize an empty string to store the binary result
    binary_result = ""

    # Regular expression to match digits
    digit_regex = /\d/

    # Loop until the decimal number is greater than 0
    while decimal > 0
        # Find the remainder when the decimal number is divided by 2
        remainder = decimal % 2

        # Prepend the remainder to the binary result string
        binary_result = remainder.to_s + binary_result

        # Update the decimal number by dividing it by 2
        decimal = decimal / 2
    end

    # Return the binary result
    binary_result
end

# Function to validate if the input is a valid decimal number
def valid_decimal?(input)
    # Regular expression to match a valid decimal number
    valid_decimal_regex = /^\d+$/
    valid_decimal_regex.match?(input)
end

# Main function to execute the program
def main
    # Prompt the user for input
    puts "Enter a decimal number to convert to binary:"
    input = gets.chomp

    # Validate the input
    if valid_decimal?(input)
        # Convert the input to an integer
        decimal_number = input.to_i

        # Perform the conversion
        binary_result = decimal_to_binary(decimal_number)

        # Display the result
        puts "The binary equivalent of #{decimal_number} is #{binary_result}"
    else
        # Display an error message for invalid input
        puts "Invalid input. Please enter a valid decimal number."
    end
end

# Call the main function to execute the program
main

