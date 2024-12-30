# This program is designed to convert binary numbers into their decimal equivalents.
# It takes a binary number as input from the user and processes it to produce the corresponding decimal number.
# The program is intended to help programmers understand the conversion process and practice their Ruby skills.

# Function to convert binary to decimal
def binary_to_decimal(binary)
    decimal = 0
    binary.reverse.each_char.with_index do |char, index|
        decimal += char.to_i * (2 ** index)
    end
    decimal
end

# Function to get user input
def get_user_input
    puts "Please enter a binary number:"
    gets.chomp
end

# Function to validate binary input
def valid_binary?(binary)
    binary.match?(/\A[01]+\z/)
end

# Main execution starts here
def main
    user_input = get_user_input

    # Validate the input to ensure it is a binary number
    if valid_binary?(user_input)
        # Convert the binary number to decimal
        result = binary_to_decimal(user_input)
        puts "The decimal equivalent of #{user_input} is #{result}."
    else
        puts "Invalid binary number. Please enter a number containing only 0s and 1s."
    end
end

# Call the main function to start the program
main

