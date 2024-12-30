# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It takes a hexadecimal number as input from the user and processes it to produce the decimal output.
# The program is written to help programmers understand the conversion process and practice their debugging skills.

# Function to convert a single hexadecimal digit to its decimal value
def hex_digit_to_decimal(digit)
    case digit.upcase
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
    when 'A' then 10
    when 'B' then 11
    when 'C' then 12
    when 'D' then 13
    when 'E' then 14
    when 'F' then 15
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

# Main program execution starts here
puts "Welcome to the Hexadecimal to Decimal Converter!"
puts "Please enter a hexadecimal number:"

# Get user input
user_input = gets.chomp

# Convert the input to decimal
result = hex_to_decimal(user_input)

# Display the result
puts "The decimal equivalent of #{user_input} is #{result}."

