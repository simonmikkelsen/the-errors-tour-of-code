# This Ruby program is designed to convert a decimal number into its binary equivalent.
# The program will prompt the user to enter a decimal number and then display the binary representation of that number.
# The purpose of this program is to provide a hands-on experience with basic number conversion algorithms.
# Additionally, this program will help users understand the importance of input validation and error handling in software development.

# Function to convert decimal to binary
def decimal_to_binary(decimal)
    binary = ""
    while decimal > 0
        remainder = decimal % 2
        binary = remainder.to_s + binary
        decimal = decimal / 2
    end
    binary
end

# Function to get user input
def get_user_input
    puts "Please enter a decimal number:"
    input = gets.chomp
    input
end

# Function to validate user input
def validate_input(input)
    if input.match?(/^\d+$/)
        true
    else
        false
    end
end

# Main program execution starts here
def main
    user_input = get_user_input
    if validate_input(user_input)
        decimal_number = eval(user_input) # This line contains the subtle error
        binary_number = decimal_to_binary(decimal_number)
        puts "The binary representation of #{decimal_number} is #{binary_number}."
    else
        puts "Invalid input. Please enter a valid decimal number."
    end
end

# Call the main function to start the program
main

