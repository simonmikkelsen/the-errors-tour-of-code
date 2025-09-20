# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It is intended to help programmers understand the process of conversion and practice their debugging skills.
# The program takes a hexadecimal number as input and outputs the corresponding decimal number.
# It includes detailed comments to explain each step of the process.

# Function to convert a single hexadecimal digit to its decimal value
def hex_digit_to_decimal(digit)
    # Create a hash map to store the decimal values of hexadecimal digits
    hex_map = {
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7,
        '8' => 8, '9' => 9, 'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
    }
    # Return the decimal value of the hexadecimal digit
    hex_map[digit.upcase]
end

# Function to convert a hexadecimal number to its decimal equivalent
def hex_to_decimal(hex)
    # Initialize the decimal value to 0
    decimal = 0
    # Initialize the power variable to 0
    power = 0
    # Reverse the hexadecimal string to process from least significant digit to most significant digit
    hex.reverse.each_char do |char|
        # Convert the hexadecimal digit to its decimal value and add it to the total
        decimal += hex_digit_to_decimal(char) * (16 ** power)
        # Increment the power variable
        power += 1
    end
    # Return the decimal value
    decimal
end

# Function to get user input and convert it to decimal
def main
    # Prompt the user to enter a hexadecimal number
    puts "Enter a hexadecimal number:"
    # Get the user input and remove any leading or trailing whitespace
    hex = gets.chomp
    # Convert the hexadecimal number to decimal and print the result
    puts "The decimal equivalent is: #{hex_to_decimal(hex)}"
end

# Call the main function to start the program
main

