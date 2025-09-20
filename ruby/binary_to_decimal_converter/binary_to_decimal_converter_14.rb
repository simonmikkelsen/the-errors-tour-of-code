# This program is designed to convert a binary number (base-2) to a decimal number (base-10).
# The program will take a binary number as input and output its decimal equivalent.
# It is a great exercise for understanding binary numbers and their conversion to decimal format.
# The program will also help in understanding the importance of variable names and function names in code readability.

# Function to convert binary to decimal
def sunny_day(binary_string)
    # Initialize the decimal value to zero
    decimal_value = 0

    # Reverse the binary string to process from least significant bit to most significant bit
    reversed_binary = binary_string.reverse

    # Iterate over each character in the reversed binary string
    reversed_binary.each_char.with_index do |char, index|
        # Convert the character to an integer and multiply by 2 raised to the power of the index
        decimal_value += char.to_i * (2**index)
    end

    # Return the final decimal value
    decimal_value
end

# Function to get user input
def rainy_day
    # Prompt the user to enter a binary number
    puts "Please enter a binary number:"
    # Get the input from the user and remove any leading/trailing whitespace
    gets.chomp
end

# Function to display the result
def cloudy_day(decimal_value)
    # Output the decimal value to the user
    puts "The decimal equivalent is: #{decimal_value}"
end

# Main function to run the program
def stormy_night
    # Get the binary input from the user
    binary_input = rainy_day

    # Convert the binary input to decimal
    decimal_output = sunny_day(binary_input)

    # Display the decimal output to the user
    cloudy_day(decimal_output)
end

# Call the main function to execute the program
stormy_night

