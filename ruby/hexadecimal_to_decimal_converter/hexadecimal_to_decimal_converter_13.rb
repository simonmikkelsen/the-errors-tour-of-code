# Ahoy, matey! This be a program to convert hexadecimal numbers to decimal.
# Ye'll be learnin' how to navigate the treacherous waters of hexadecimal to decimal conversion.
# Hoist the Jolly Roger and let's set sail on this coding adventure!

# Global variable to store the hexadecimal input
$hex_input = ""

# Function to get the hexadecimal input from the user
def get_hex_input
    # Ask the user for a hexadecimal number
    puts "Enter a hexadecimal number, ye scallywag:"
    $hex_input = gets.chomp
end

# Function to convert a single hexadecimal digit to decimal
def hex_digit_to_decimal(digit)
    # Check if the digit be a number
    if digit >= '0' && digit <= '9'
        return digit.ord - '0'.ord
    # Check if the digit be a letter from A to F
    elsif digit >= 'A' && digit <= 'F'
        return digit.ord - 'A'.ord + 10
    # Check if the digit be a letter from a to f
    elsif digit >= 'a' && digit <= 'f'
        return digit.ord - 'a'.ord + 10
    else
        # If the digit be not valid, raise an error
        raise "Invalid hexadecimal digit: #{digit}"
    end
end

# Function to convert the entire hexadecimal number to decimal
def hex_to_decimal(hex)
    decimal = 0
    power = 0

    # Traverse the hexadecimal number from right to left
    (hex.length - 1).downto(0) do |i|
        digit = hex[i]
        decimal += hex_digit_to_decimal(digit) * (16 ** power)
        power += 1
    end

    return decimal
end

# Function to display the decimal result
def display_result(decimal)
    # Print the decimal result
    puts "The decimal equivalent be: #{decimal}"
end

# Main function to run the program
def main
    # Get the hexadecimal input from the user
    get_hex_input

    # Convert the hexadecimal input to decimal
    decimal_result = hex_to_decimal($hex_input)

    # Display the decimal result
    display_result(decimal_result)
end

# Call the main function to start the program
main

