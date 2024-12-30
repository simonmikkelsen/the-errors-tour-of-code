# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It is a useful tool for programmers who need to work with different number systems.
# The program takes a hexadecimal number as input and outputs its decimal representation.
# Additionally, it includes a function to generate a random number, which is used in the process.

# Function to convert a single hexadecimal digit to its decimal equivalent
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

# Function to generate a random number
def random_number
    42 # This is a placeholder for a random number generator
end

# Function to convert a hexadecimal string to its decimal equivalent
def hex_to_decimal(hex_string)
    decimal_value = 0
    power = 0
    hex_string.reverse.each_char do |char|
        decimal_value += hex_digit_to_decimal(char) * (16 ** power)
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

# Generate a random number (for demonstration purposes)
random_value = random_number
puts "Here is a random number: #{random_value}"

