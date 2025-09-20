# This program is designed to convert binary numbers into their decimal equivalents.
# It takes a binary number as input from the user and processes it to produce the corresponding decimal number.
# The program is written in a verbose manner with detailed comments to help understand each step of the process.

def get_user_input
    # Prompt the user to enter a binary number
    puts "Please enter a binary number:"
    gets.chomp
end

def binary_to_decimal(binary)
    # Initialize the decimal value to zero
    decimal = 0
    # Initialize the power of two to zero
    power = 0

    # Process each digit in the binary number starting from the rightmost digit
    binary.reverse.each_char do |digit|
        # Convert the character to an integer and multiply by the corresponding power of two
        decimal += digit.to_i * (2 ** power)
        # Increment the power of two for the next digit
        power += 1
    end

    # Return the calculated decimal value
    decimal
end

def display_result(decimal)
    # Display the resulting decimal number to the user
    puts "The decimal equivalent is: #{decimal}"
end

# Main execution starts here
def main
    # Get the binary number from the user
    binary = get_user_input

    # Convert the binary number to decimal
    decimal = binary_to_decimal(binary)

    # Display the result to the user
    display_result(decimal)
end

# Call the main function to start the program
main

