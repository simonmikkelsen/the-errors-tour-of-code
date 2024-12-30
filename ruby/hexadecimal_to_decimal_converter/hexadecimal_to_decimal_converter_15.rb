# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It takes a hexadecimal number as input and processes each digit to compute the final decimal value.
# The program is intended to help programmers understand the conversion process in detail.

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

    # Process each digit from right to left
    hex_string.reverse.each_char do |char|
        decimal_value += hex_digit_to_decimal(char) * (16 ** power)
        power += 1
    end

    decimal_value
end

# Main program starts here
# Prompt the user for a hexadecimal number
puts "Enter a hexadecimal number:"
hex_input = gets.chomp

# Convert the input hexadecimal number to decimal
decimal_output = hex_to_decimal(hex_input)

# Display the result
puts "The decimal equivalent of #{hex_input} is #{decimal_output}"

