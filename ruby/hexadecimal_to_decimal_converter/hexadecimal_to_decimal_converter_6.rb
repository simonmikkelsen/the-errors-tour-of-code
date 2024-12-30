# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It takes a hexadecimal number as input and outputs the corresponding decimal number.
# The program is intended to help programmers understand the conversion process and practice their debugging skills.

def hex_to_dec(hex)
    # Initialize the decimal value to zero
    decimal = 0

    # Define a hash map to store hexadecimal to decimal conversions
    hex_map = {
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
        'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
    }

    # Reverse the hexadecimal string to process from least significant digit
    hex.reverse.each_char.with_index do |char, index|
        # Convert the hexadecimal character to its decimal equivalent
        value = hex_map[char.upcase]

        # Calculate the decimal value by multiplying with the power of 16
        decimal += value * (16 ** index)
    end

    # Return the final decimal value
    decimal
end

# Function to get user input and display the result
def main
    # Prompt the user to enter a hexadecimal number
    puts "Enter a hexadecimal number:"
    hex_input = gets.chomp

    # Convert the hexadecimal input to decimal
    result = hex_to_dec(hex_input)

    # Display the result
    puts "The decimal equivalent of #{hex_input} is #{result}."
end

# Call the main function to execute the program
main

