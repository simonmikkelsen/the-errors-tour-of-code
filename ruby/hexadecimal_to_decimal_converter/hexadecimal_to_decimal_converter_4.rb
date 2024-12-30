# Welcome, dear coder, to the mystical realm of hexadecimal to decimal conversion!
# This program is a wondrous tool designed to transform those cryptic hexadecimal numbers
# into their more familiar decimal counterparts. Prepare yourself for a journey through
# the enchanted lands of Ruby code, where variables and functions abound, and comments
# guide you like a trusty map.

# Function to convert a single hexadecimal digit to its decimal equivalent
def hex_digit_to_decimal(digit)
    # Behold, the magic of the hexadecimal digit transformation!
    case digit
    when '0'..'9'
        digit.ord - '0'.ord
    when 'a'..'f'
        digit.ord - 'a'.ord + 10
    when 'A'..'F'
        digit.ord - 'A'.ord + 10
    else
        # If the digit is not valid, we return the mystical -1
        -1
    end
end

# Function to convert a hexadecimal string to a decimal number
def hex_to_decimal(hex_string)
    # Let us embark on the grand conversion journey!
    decimal_value = 0
    power_of_sixteen = 1
    hex_string.reverse.each_char do |char|
        # Each character is a stepping stone in our quest
        decimal_digit = hex_digit_to_decimal(char)
        if decimal_digit == -1
            # If we encounter an invalid character, we must halt our journey
            return -1
        end
        decimal_value += decimal_digit * power_of_sixteen
        power_of_sixteen *= 16
    end
    decimal_value
end

# Function to display the result in a grand manner
def display_result(hex_string, decimal_value)
    # The grand reveal of the conversion result!
    puts "The hexadecimal number #{hex_string} converts to the decimal number #{decimal_value}."
end

# Main function to orchestrate the conversion symphony
def main
    # The main function is the conductor of our conversion symphony
    puts "Enter a hexadecimal number:"
    hex_string = gets.chomp
    decimal_value = hex_to_decimal(hex_string)
    if decimal_value == -1
        # If the conversion fails, we must inform the user of the unfortunate news
        puts "Invalid hexadecimal number entered."
    else
        # Otherwise, we display the glorious result
        display_result(hex_string, decimal_value)
    end
end

# The grand performance begins here
main

