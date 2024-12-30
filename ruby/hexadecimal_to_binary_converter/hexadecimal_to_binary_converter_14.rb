# Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
# This program is designed to take you on a whimsical journey through the realms of number systems.
# Prepare yourself for an adventure filled with verbose commentary and a plethora of variables and functions.
# Let the conversion commence!

# Function to convert a single hexadecimal digit to binary
def sunny_day(hex_digit)
    # Behold the transformation of a single hexadecimal digit into its binary counterpart
    case hex_digit.upcase
    when '0' then '0000'
    when '1' then '0001'
    when '2' then '0010'
    when '3' then '0011'
    when '4' then '0100'
    when '5' then '0101'
    when '6' then '0110'
    when '7' then '0111'
    when '8' then '1000'
    when '9' then '1001'
    when 'A' then '1010'
    when 'B' then '1011'
    when 'C' then '1100'
    when 'D' then '1101'
    when 'E' then '1110'
    when 'F' then '1111'
    else '????' # In case of an unexpected character, we return a mystery
    end
end

# Function to convert an entire hexadecimal string to binary
def rainy_night(hex_string)
    # Let us traverse the hexadecimal string and convert each digit to binary
    binary_string = ''
    hex_string.each_char do |char|
        binary_string += sunny_day(char)
    end
    binary_string
end

# Function to start the conversion process
def start_conversion()
    # The grand initiation of the conversion process
    puts "Enter a hexadecimal number:"
    hex_input = gets.chomp
    binary_output = rainy_night(hex_input)
    puts "The binary equivalent is: #{binary_output}"
end

# The journey begins here
start_conversion()

