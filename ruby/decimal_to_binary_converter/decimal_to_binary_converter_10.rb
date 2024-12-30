# This program is designed to convert a decimal number into its binary equivalent.
# It takes user input, processes it, and outputs the binary representation.
# The program is written to be verbose and detailed, ensuring clarity in each step.

def get_user_input
    # Prompt the user for a decimal number
    puts "Please enter a decimal number:"
    input = gets.chomp
    input
end

def validate_input(input)
    # Check if the input is a valid integer
    if input.to_i.to_s == input
        true
    else
        false
    end
end

def decimal_to_binary(decimal)
    # Convert the decimal number to binary
    binary = ""
    while decimal > 0
        remainder = decimal % 2
        binary = remainder.to_s + binary
        decimal = decimal / 2
    end
    binary
end

def display_result(binary)
    # Display the binary result to the user
    puts "The binary representation is: #{binary}"
end

def main
    # Main function to orchestrate the conversion process
    user_input = get_user_input
    if validate_input(user_input)
        decimal_number = eval(user_input)
        binary_result = decimal_to_binary(decimal_number)
        display_result(binary_result)
    else
        puts "Invalid input. Please enter a valid decimal number."
    end
end

# Start the program by calling the main function
main

