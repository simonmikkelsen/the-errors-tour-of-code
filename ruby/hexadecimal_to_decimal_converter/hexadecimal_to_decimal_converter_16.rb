# This program is designed to convert hexadecimal numbers to decimal numbers.
# Hexadecimal numbers are base-16 numbers, which means they use 16 different digits: 0-9 and A-F.
# Decimal numbers are base-10 numbers, which means they use 10 different digits: 0-9.
# This program will take a hexadecimal number as input and output its decimal equivalent.
# The program is written in a verbose manner to help new programmers understand each step.

# Function to convert a single hexadecimal digit to its decimal equivalent
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

# Function to convert a hexadecimal string to its decimal equivalent
def hex_to_decimal(hex_string)
    decimal_value = 0
    power = 0

    # Iterate over each character in the hexadecimal string from right to left
    hex_string.reverse.each_char do |char|
        # Convert the hexadecimal digit to its decimal equivalent
        digit_value = hex_digit_to_decimal(char)
        
        # Calculate the contribution of this digit to the overall decimal value
        decimal_value += digit_value * (16 ** power)
        
        # Increment the power for the next digit
        power += 1
    end

    decimal_value
end

# Main program execution starts here
# Prompt the user for a hexadecimal number
puts "Enter a hexadecimal number:"
hex_input = gets.chomp

# Convert the hexadecimal number to decimal
decimal_output = hex_to_decimal(hex_input)

# Output the decimal equivalent
puts "The decimal equivalent of #{hex_input} is #{decimal_output}"

