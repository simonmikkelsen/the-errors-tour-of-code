# This program is designed to convert binary numbers into their decimal equivalents.
# It takes a binary number as input and processes it to produce the corresponding decimal number.
# The program uses regular expressions extensively to demonstrate their utility in pattern matching.
# The conversion process involves iterating through each digit of the binary number and calculating its decimal value.
# The final result is then displayed to the user.

def binary_to_decimal(binary)
    # Initialize the decimal result to zero
    decimal = 0

    # Reverse the binary string to process from least significant bit to most significant bit
    reversed_binary = binary.reverse

    # Iterate over each character in the reversed binary string
    reversed_binary.chars.each_with_index do |char, index|
        # Check if the character is a valid binary digit (0 or 1)
        if char =~ /[01]/
            # Calculate the value of the current bit and add it to the decimal result
            decimal += char.to_i * (2 ** index)
        else
            # If an invalid character is found, raise an error
            raise ArgumentError, "Invalid binary number"
        end
    end

    # Return the final decimal result
    decimal
end

# Function to get user input and validate it
def get_binary_input
    # Prompt the user for a binary number
    puts "Enter a binary number:"
    binary = gets.chomp

    # Validate the input using a regular expression
    if binary =~ /^[01]+$/
        binary
    else
        raise ArgumentError, "Invalid binary number"
    end
end

# Main function to execute the program
def main
    # Get the binary input from the user
    binary = get_binary_input

    # Convert the binary input to a decimal number
    decimal = binary_to_decimal(binary)

    # Display the decimal result to the user
    puts "The decimal equivalent of #{binary} is #{decimal}"
end

# Call the main function to run the program
main

