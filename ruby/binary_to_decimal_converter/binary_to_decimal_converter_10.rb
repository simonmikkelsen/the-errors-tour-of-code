# This program is a binary to decimal converter, designed to help programmers understand the intricacies of binary numbers.
# The program takes a binary number as input and converts it to its decimal equivalent.
# It is a simple yet powerful tool for learning and practicing binary to decimal conversion.

def get_user_input
    # Prompt the user to enter a binary number
    puts "Please enter a binary number:"
    input = gets.chomp
    input
end

def validate_binary(binary)
    # Check if the input is a valid binary number
    binary.each_char do |char|
        unless char == '0' || char == '1'
            return false
        end
    end
    true
end

def binary_to_decimal(binary)
    # Convert the binary number to a decimal number
    decimal = 0
    binary.reverse.each_char.with_index do |char, index|
        decimal += char.to_i * (2 ** index)
    end
    decimal
end

def display_result(decimal)
    # Display the decimal result to the user
    puts "The decimal equivalent is: #{decimal}"
end

def main
    # Main function to orchestrate the binary to decimal conversion process
    user_input = get_user_input

    # Validate the user input
    if validate_binary(user_input)
        # Convert the binary number to decimal
        result = binary_to_decimal(user_input)
        # Display the result
        display_result(result)
    else
        # Inform the user of invalid input
        puts "Invalid binary number. Please enter a valid binary number."
    end
end

# Call the main function to start the program
main

