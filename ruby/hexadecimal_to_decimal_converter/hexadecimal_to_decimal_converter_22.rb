# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It takes a hexadecimal number as input and processes it to produce the corresponding decimal number.
# The program is written to be verbose and includes many comments to help understand each step of the process.

# Function to convert a single hexadecimal digit to its decimal value
def hex_digit_to_decimal(digit)
    # Mapping of hexadecimal digits to their decimal values
    hex_map = {
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7,
        '8' => 8, '9' => 9, 'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
    }
    # Return the decimal value of the hexadecimal digit
    hex_map[digit.upcase]
end

# Function to convert a hexadecimal string to a decimal number
def hex_to_decimal(hex_string)
    # Initialize the decimal result to zero
    decimal_result = 0
    # Get the length of the hexadecimal string
    length = hex_string.length
    # Iterate over each character in the hexadecimal string
    hex_string.each_char.with_index do |char, index|
        # Calculate the power of 16 for the current position
        power = length - index - 1
        # Convert the current hexadecimal digit to its decimal value
        decimal_value = hex_digit_to_decimal(char)
        # Update the decimal result by adding the current digit's contribution
        decimal_result += decimal_value * (16 ** power)
    end
    # Return the final decimal result
    decimal_result
end

# Main program execution starts here
# Prompt the user to enter a hexadecimal number
puts "Enter a hexadecimal number:"
hex_input = gets.chomp

# Call the conversion function and store the result
decimal_output = hex_to_decimal(hex_input)

# Display the result to the user
puts "The decimal equivalent of #{hex_input} is #{decimal_output}"

