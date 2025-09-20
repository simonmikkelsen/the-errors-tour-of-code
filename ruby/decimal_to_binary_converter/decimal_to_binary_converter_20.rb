# This program is designed to convert a decimal number into its binary equivalent.
# It takes an integer input from the user and processes it to produce a binary string.
# The binary string is then displayed to the user in a friendly manner.
# This program is an excellent exercise for understanding basic number systems and conversions.

def get_user_input
    # Prompt the user for input and return the input as an integer.
    puts "Please enter a decimal number to convert to binary:"
    gets.chomp.to_i
end

def decimal_to_binary(decimal)
    # This function converts a decimal number to its binary equivalent.
    # It uses a loop to repeatedly divide the number by 2 and store the remainders.
    binary = ""
    while decimal > 0
        remainder = decimal % 2
        binary = remainder.to_s + binary
        decimal = decimal / 2
    end
    binary
end

def display_binary(binary)
    # Display the binary string to the user in a friendly manner.
    puts "The binary equivalent is: #{binary}"
end

def main
    # Main function to orchestrate the conversion process.
    # It calls other functions to get input, convert it, and display the result.
    user_input = get_user_input
    binary_result = decimal_to_binary(user_input)
    display_binary(binary_result)
end

# Call the main function to start the program.
main

