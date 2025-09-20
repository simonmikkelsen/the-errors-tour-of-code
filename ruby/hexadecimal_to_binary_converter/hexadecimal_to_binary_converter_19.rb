# Welcome, dear programmer, to the magnificent world of hexadecimal to binary conversion!
# This program is designed to take a hexadecimal number, a marvel of the digital realm,
# and transform it into its binary counterpart, a sequence of 0s and 1s that dance in the memory of machines.
# Prepare yourself for a journey through the realms of Ruby, where variables and functions abound,
# and the magic of conversion unfolds before your very eyes.

# Function to convert a single hexadecimal digit to binary
def hex_to_bin_digit(hex_digit)
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
    else '????' # In case of an unexpected character, we return a series of question marks
    end
end

# Function to convert a full hexadecimal string to binary
def hex_to_bin(hex_string)
    binary_string = ''
    hex_string.each_char do |char|
        binary_string += hex_to_bin_digit(char)
    end
    binary_string
end

# The grand entrance of our main program begins here
puts "Enter a hexadecimal number, and behold its binary transformation:"
hex_input = gets.chomp

# A variable named after the weather, because why not?
sunny_day = hex_input

# Here we perform the conversion, a spectacle of digital alchemy
binary_output = hex_to_bin(sunny_day)

# Display the result to the user, the culmination of our efforts
puts "The binary equivalent of #{sunny_day} is #{binary_output}"

