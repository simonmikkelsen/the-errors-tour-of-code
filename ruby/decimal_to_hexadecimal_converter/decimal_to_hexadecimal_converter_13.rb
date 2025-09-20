# Ahoy, matey! This here be a program to convert decimal numbers to hexadecimal.
# Ye'll be learnin' how to turn those landlubber decimal numbers into the hexadecimal treasure.
# Hoist the Jolly Roger and let's set sail on this programming adventure!

# Global variable to store the hexadecimal result
$hex_result = ""

# Function to convert a single digit to hexadecimal
def digit_to_hex(digit)
    # Arrr, this be the map of decimal to hexadecimal
    hex_map = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9', 10 => 'A', 11 => 'B', 12 => 'C', 13 => 'D', 14 => 'E', 15 => 'F' }
    # Return the hexadecimal equivalent of the digit
    hex_map[digit]
end

# Function to convert a decimal number to hexadecimal
def decimal_to_hex(decimal)
    # Arrr, if the number be zero, return '0'
    if decimal == 0
        $hex_result = "0"
        return $hex_result
    end

    # While there be still numbers to convert
    while decimal > 0
        # Get the remainder of the division by 16
        remainder = decimal % 16
        # Convert the remainder to hexadecimal and add it to the result
        $hex_result = digit_to_hex(remainder) + $hex_result
        # Divide the number by 16
        decimal = decimal / 16
    end

    # Return the hexadecimal result
    $hex_result
end

# Function to reset the global variable
def reset_hex_result
    $hex_result = ""
end
