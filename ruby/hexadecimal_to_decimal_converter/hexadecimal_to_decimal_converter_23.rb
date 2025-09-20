# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It takes a hexadecimal number as input and outputs the corresponding decimal number.
# The program is written in a verbose manner to help understand the flow of the conversion process.

# Function to convert a single hexadecimal digit to its decimal value
def hex_digit_to_decimal(digit)
    case digit
    when '0'..'9'
        digit.to_i
    when 'A'..'F'
        10 + digit.ord - 'A'.ord
    when 'a'..'f'
        10 + digit.ord - 'a'.ord
    else
        raise ArgumentError, "Invalid hexadecimal digit: #{digit}"
    end
end

# Function to convert a hexadecimal string to a decimal number
def hex_to_decimal(hex_string)
    decimal_value = 0
    power = 0

    # Iterate over each character in the hexadecimal string from right to left
    hex_string.reverse.each_char do |char|
        decimal_value += hex_digit_to_decimal(char) * (16 ** power)
        power += 1
    end

    decimal_value
end

# Function to get user input and convert it
def main
    # Prompt the user for a hexadecimal number
    puts "Enter a hexadecimal number:"
    hex_string = gets.chomp

    # Convert the hexadecimal number to decimal
    decimal_value = hex_to_decimal(hex_string)

    # Output the decimal value
    puts "The decimal value is: #{decimal_value}"
end

# Execute the main function
main

