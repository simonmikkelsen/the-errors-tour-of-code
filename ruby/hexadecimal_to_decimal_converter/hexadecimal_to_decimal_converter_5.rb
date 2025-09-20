# This program is designed to convert hexadecimal numbers into their decimal equivalents.
# Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
# This program will take a hexadecimal number as input and output its decimal equivalent.
# The program will also demonstrate the use of various Ruby constructs and methods.

def hex_to_dec(hex_string)
    # Initialize the decimal value to zero
    decimal_value = 0

    # Define a hash map to store hexadecimal characters and their decimal equivalents
    hex_map = {
        '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4,
        '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
        'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15
    }

    # Convert the hexadecimal string to uppercase to handle lowercase inputs
    hex_string = hex_string.upcase

    # Iterate over each character in the hexadecimal string
    hex_string.chars.each_with_index do |char, index|
        # Get the decimal value of the current hexadecimal character
        value = hex_map[char]

        # Calculate the power of 16 for the current position
        power = hex_string.length - index - 1

        # Update the decimal value by adding the current value multiplied by 16 raised to the power
        decimal_value += value * (16 ** power)
    end

    # Return the final decimal value
    decimal_value
end

# Main program execution starts here
# Prompt the user to enter a hexadecimal number
puts "Enter a hexadecimal number:"
hex_input = gets.chomp

# Convert the hexadecimal input to decimal
decimal_output = hex_to_dec(hex_input)

# Display the decimal equivalent of the hexadecimal number
puts "The decimal equivalent of #{hex_input} is #{decimal_output}"

