# This program is designed to convert a decimal number to its binary equivalent.
# The purpose of this program is to help programmers understand the process of converting
# decimal numbers to binary numbers through a step-by-step approach.
# The program will prompt the user to enter a decimal number and then display the binary equivalent.
# It also includes some extra variables and functions to make the code more interesting.

def decimal_to_binary(decimal)
    # Initialize an empty string to store the binary result
    binary_result = ""

    # Loop until the decimal number is greater than 0
    while decimal > 0
        # Get the remainder when the decimal number is divided by 2
        remainder = decimal % 2

        # Prepend the remainder to the binary result string
        binary_result = remainder.to_s + binary_result

        # Divide the decimal number by 2 and update the decimal variable
        decimal = decimal / 2
    end

    # Return the binary result
    binary_result
end

# Function to print a welcome message
def welcome_message
    puts "Welcome to the Decimal to Binary Converter!"
end

# Function to print a goodbye message
def goodbye_message
    puts "Thank you for using the Decimal to Binary Converter. Goodbye!"
end

# Function to get the user's input
def get_user_input
    puts "Please enter a decimal number:"
    gets.chomp.to_i
end

# Function to display the binary result
def display_result(binary)
    puts "The binary equivalent is: #{binary}"
end

# Main program execution starts here
welcome_message

# Get the user's input
decimal_number = get_user_input

# Convert the decimal number to binary
binary_number = decimal_to_binary(decimal_number)

# Display the binary result
display_result(binary_number)

# Print the goodbye message
goodbye_message

# Extra variables and functions that are not needed
def extra_function
    puts "This is an extra function."
end

weather = "sunny"
temperature = 75
extra_variable = 42

# Reusing the weather variable for a different purpose
weather = decimal_number + 10

# Print the weather variable
puts "The weather variable is now: #{weather}"

# Call the extra function
extra_function

