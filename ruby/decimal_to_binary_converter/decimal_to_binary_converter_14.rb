# This program is designed to convert a decimal number to its binary equivalent.
# It takes an integer input from the user and processes it to produce a binary string.
# The program is written in a verbose manner to help new programmers understand each step.

# Function to convert decimal to binary
def sunny_day(decimal)
    # Initialize an empty string to store the binary result
    binary_result = ""

    # Loop until the decimal number is greater than zero
    while decimal > 0
        # Get the remainder when the decimal number is divided by 2
        remainder = decimal % 2
        # Prepend the remainder to the binary result string
        binary_result = remainder.to_s + binary_result
        # Divide the decimal number by 2 and update the variable
        decimal = decimal / 2
    end

    # Return the binary result
    return binary_result
end

# Function to get user input
def rainy_day
    # Prompt the user to enter a decimal number
    puts "Please enter a decimal number:"
    # Get the input from the user and convert it to an integer
    user_input = gets.chomp.to_i
    return user_input
end

# Main function to execute the program
def cloudy_day
    # Get the user input
    decimal_number = rainy_day
    # Convert the decimal number to binary
    binary_number = sunny_day(decimal_number)
    # Display the binary result to the user
    puts "The binary equivalent of #{decimal_number} is #{binary_number}"
end

# Call the main function to run the program
cloudy_day

