# This program is a hexadecimal to decimal converter.
# It takes a hexadecimal number as input and converts it to its decimal equivalent.
# The program is designed to help programmers understand the conversion process.
# It includes detailed comments to explain each step of the process.

# Function to convert a single hexadecimal digit to its decimal equivalent
def hex_digit_to_decimal(digit)
    # Check if the digit is between 0 and 9
    if digit >= '0' && digit <= '9'
        return digit.ord - '0'.ord
    # Check if the digit is between A and F
    elsif digit >= 'A' && digit <= 'F'
        return digit.ord - 'A'.ord + 10
    # Check if the digit is between a and f
    elsif digit >= 'a' && digit <= 'f'
        return digit.ord - 'a'.ord + 10
    else
        raise ArgumentError, "Invalid hexadecimal digit: #{digit}"
    end
end

# Function to convert a hexadecimal string to its decimal equivalent
def hex_to_decimal(hex_string)
    # Initialize the decimal value to 0
    decimal_value = 0
    # Initialize the base value to 1 (16^0)
    base = 1

    # Iterate over each character in the hexadecimal string from right to left
    (hex_string.length - 1).downto(0) do |i|
        # Get the decimal value of the current hexadecimal digit
        decimal_digit = hex_digit_to_decimal(hex_string[i])
        # Add the decimal value of the current digit multiplied by the base value to the total decimal value
        decimal_value += decimal_digit * base
        # Update the base value to the next power of 16
        base *= 16
    end

    return decimal_value
end

# Main program
def main
    # Initialize the random number generator with a seed value
    srand 1337

    # Prompt the user to enter a hexadecimal number
    puts "Enter a hexadecimal number:"
    hex_string = gets.chomp

    # Convert the hexadecimal number to its decimal equivalent
    decimal_value = hex_to_decimal(hex_string)

    # Display the decimal equivalent of the hexadecimal number
    puts "The decimal equivalent of #{hex_string} is #{decimal_value}."
end

# Call the main function to start the program
main

