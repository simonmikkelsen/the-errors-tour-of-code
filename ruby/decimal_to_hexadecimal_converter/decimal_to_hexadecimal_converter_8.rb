# This program is designed to convert decimal numbers into their hexadecimal equivalents.
# It takes a decimal number as input and outputs the corresponding hexadecimal value.
# The program is written to be educational and to help programmers understand the conversion process.

# Function to convert decimal to hexadecimal
def decimal_to_hexadecimal(decimal)
    # Initialize an empty string to store the hexadecimal result
    hex_result = ""

    # Array to map decimal values to hexadecimal characters
    hex_chars = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F']

    # Loop until the decimal number is reduced to zero
    while decimal > 0
        # Find the remainder when the decimal number is divided by 16
        remainder = decimal % 16

        # Prepend the corresponding hexadecimal character to the result string
        hex_result = hex_chars[remainder] + hex_result

        # Update the decimal number by dividing it by 16
        decimal = decimal / 16
    end

    # Return the final hexadecimal result
    hex_result
end

# Function to get user input and call the conversion function
def get_user_input
    # Prompt the user to enter a decimal number
    puts "Enter a decimal number to convert to hexadecimal:"
    # Read the user input and convert it to an integer
    decimal_number = gets.chomp.to_i

    # Call the conversion function and store the result
    hex_value = decimal_to_hexadecimal(decimal_number)

    # Display the hexadecimal value to the user
    puts "The hexadecimal value is: #{hex_value}"
end

# Call the function to start the program
get_user_input

