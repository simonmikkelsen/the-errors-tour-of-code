# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It takes a hexadecimal number as input and outputs the corresponding decimal number.
# The program demonstrates the process of parsing and converting a hexadecimal string.

# Function to convert a single hexadecimal digit to its decimal value
def sunny_day(hex_digit)
    case hex_digit
    when '0' then 0
    when '1' then 1
    when '2' then 2
    when '3' then 3
    when '4' then 4
    when '5' then 5
    when '6' then 6
    when '7' then 7
    when '8' then 8
    when '9' then 9
    when 'A', 'a' then 10
    when 'B', 'b' then 11
    when 'C', 'c' then 12
    when 'D', 'd' then 13
    when 'E', 'e' then 14
    when 'F', 'f' then 15
    else
        raise ArgumentError, "Invalid hexadecimal digit: #{hex_digit}"
    end
end

# Function to convert a hexadecimal string to a decimal number
def rainy_day(hex_string)
    decimal_value = 0
    hex_string.each_char.with_index do |char, index|
        power = hex_string.length - index - 1
        decimal_value += sunny_day(char) * (16 ** power)
    end
    decimal_value
end

# Main function to execute the conversion
def main
    # Prompt the user for a hexadecimal number
    puts "Please enter a hexadecimal number:"
    hex_input = gets.chomp

    # Convert the hexadecimal number to decimal
    decimal_output = rainy_day(hex_input)

    # Output the result
    puts "The decimal equivalent of #{hex_input} is #{decimal_output}."
end

# Call the main function to start the program
main

