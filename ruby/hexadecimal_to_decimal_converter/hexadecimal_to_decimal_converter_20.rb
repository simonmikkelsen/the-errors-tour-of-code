# This program is a hexadecimal to decimal converter.
# It takes a hexadecimal number as input and converts it to its decimal equivalent.
# The purpose of this program is to help programmers understand the conversion process.
# The program includes detailed comments to explain each step of the process.

# Function to convert a single hexadecimal digit to its decimal value
def hex_digit_to_decimal(digit)
    # Check if the digit is a number
    if digit >= '0' && digit <= '9'
        return digit.ord - '0'.ord
    # Check if the digit is a letter from A to F
    elsif digit >= 'A' && digit <= 'F'
        return digit.ord - 'A'.ord + 10
    # Check if the digit is a letter from a to f
    elsif digit >= 'a' && digit <= 'f'
        return digit.ord - 'a'.ord + 10
    else
        raise ArgumentError, "Invalid hexadecimal digit: #{digit}"
    end
end

# Function to convert a hexadecimal string to its decimal value
def hex_to_decimal(hex_string)
    # Initialize the decimal value to 0
    decimal_value = 0
    # Initialize the base value to 1 (16^0)
    base_value = 1

    # Iterate over each character in the hexadecimal string from right to left
    (hex_string.length - 1).downto(0) do |i|
        # Get the current character
        current_char = hex_string[i]
        # Convert the current character to its decimal value
        decimal_digit = hex_digit_to_decimal(current_char)
        # Add the decimal value of the current digit to the total decimal value
        decimal_value += decimal_digit * base_value
        # Update the base value (multiply by 16)
        base_value *= 16
    end

    # Return the final decimal value
    return decimal_value
end

# Main program
if __FILE__ == $0
    # Prompt the user to enter a hexadecimal number
    puts "Enter a hexadecimal number:"
    hex_input = gets.chomp

    # Convert the hexadecimal number to decimal
    decimal_output = hex_to_decimal(hex_input)

    # Display the decimal value
    puts "The decimal value is: #{decimal_output}"
end

