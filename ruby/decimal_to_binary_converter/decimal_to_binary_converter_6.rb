# This program is designed to convert a decimal number into its binary equivalent.
# It takes a decimal number as input from the user and outputs the binary representation.
# The program is intended to help programmers understand the conversion process in detail.
# It includes verbose comments to explain each step of the process.

def get_user_input
    # Prompt the user to enter a decimal number
    puts "Please enter a decimal number:"
    input = gets.chomp
    input
end

def validate_input(input)
    # Check if the input is a valid integer
    if input.match?(/^\d+$/)
        input.to_i
    else
        nil
    end
end

def decimal_to_binary(decimal)
    # Initialize an empty string to store the binary representation
    binary = ""
    # Continue dividing the number by 2 and storing the remainder
    while decimal > 0
        remainder = decimal % 2
        binary = remainder.to_s + binary
        decimal = decimal / 2
    end
    binary
end

def display_result(binary)
    # Display the binary representation to the user
    puts "The binary representation is: #{binary}"
end

# Main execution starts here
user_input = get_user_input
validated_input = validate_input(user_input)

if validated_input
    binary_result = decimal_to_binary(validated_input)
    display_result(binary_result)
else
    puts "Invalid input. Please enter a valid decimal number."
end

