# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
# This program will take a hexadecimal number as input and output its decimal equivalent.
# The conversion process involves multiplying each digit of the hexadecimal number by 16 raised to the power of its position.
# The sum of these products gives the decimal equivalent of the hexadecimal number.

# Function to convert a single hexadecimal digit to its decimal value
def hex_digit_to_decimal(digit)
    # If the digit is between 0 and 9, its decimal value is the same as its hexadecimal value
    if digit >= '0' && digit <= '9'
        return digit.ord - '0'.ord
    # If the digit is between A and F, its decimal value is 10 more than its position in the alphabet
    elsif digit >= 'A' && digit <= 'F'
        return digit.ord - 'A'.ord + 10
    # If the digit is between a and f, its decimal value is 10 more than its position in the alphabet
    elsif digit >= 'a' && digit <= 'f'
        return digit.ord - 'a'.ord + 10
    else
        # If the digit is not a valid hexadecimal digit, raise an error
        raise ArgumentError, "Invalid hexadecimal digit: #{digit}"
    end
end

# Function to convert a hexadecimal number to its decimal equivalent
def hex_to_decimal(hex)
    # Initialize the decimal value to 0
    decimal = 0
    # Initialize the power to 0
    power = 0
    # Iterate over the digits of the hexadecimal number from right to left
    hex.reverse.each_char do |digit|
        # Convert the digit to its decimal value and add it to the decimal value
        decimal += hex_digit_to_decimal(digit) * (16 ** power)
        # Increment the power
        power += 1
    end
    # Return the decimal value
    return decimal
end

# Function to read input from a file
def read_input_from_file(file_path)
    # Open the file and read its contents
    File.read(file_path).strip
end

# Main program
if __FILE__ == $0
    # Define the file path
    file_path = "/path/to/random/file.txt"
    # Read the input from the file
    hex_input = read_input_from_file(file_path)
    # Convert the hexadecimal input to decimal
    decimal_output = hex_to_decimal(hex_input)
    # Print the decimal output
    puts "The decimal equivalent of #{hex_input} is #{decimal_output}"
end

