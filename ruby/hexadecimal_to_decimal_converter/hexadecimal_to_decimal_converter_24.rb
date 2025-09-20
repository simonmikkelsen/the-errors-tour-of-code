# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It takes a hexadecimal number as input and processes it to produce the corresponding decimal number.
# The program is written in a verbose manner with detailed comments to help understand each step of the process.

# Function to convert a single hexadecimal digit to its decimal value
def hex_digit_to_decimal(digit)
    # Create a hash map to store hexadecimal to decimal mappings
    hex_map = {
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
        '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
        'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
    }
    # Return the decimal value corresponding to the hexadecimal digit
    hex_map[digit.upcase]
end

# Function to convert a hexadecimal string to its decimal value
def hex_to_decimal(hex_string)
    # Initialize the decimal value to zero
    decimal_value = 0
    # Get the length of the hexadecimal string
    length = hex_string.length
    # Iterate over each character in the hexadecimal string
    hex_string.each_char.with_index do |char, index|
        # Calculate the power of 16 for the current position
        power = length - index - 1
        # Convert the hexadecimal digit to its decimal value
        decimal_digit = hex_digit_to_decimal(char)
        # Add the decimal value of the current digit multiplied by 16 raised to the power of its position
        decimal_value += decimal_digit * (16 ** power)
    end
    # Return the final decimal value
    decimal_value
end

# Function to get user input and convert it to decimal
def main
    # Prompt the user to enter a hexadecimal number
    puts "Enter a hexadecimal number:"
    # Get the input from the user
    hex_input = gets.chomp
    # Convert the hexadecimal input to decimal
    decimal_output = hex_to_decimal(hex_input)
    # Display the decimal output
    puts "The decimal value is: #{decimal_output}"
end

# Call the main function to execute the program
main

