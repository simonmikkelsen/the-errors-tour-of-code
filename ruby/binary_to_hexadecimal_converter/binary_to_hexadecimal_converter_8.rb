# Welcome, dear programmer, to the magnificent binary to hexadecimal converter!
# This program is designed to take a binary number, that is a number composed of 0s and 1s,
# and transform it into its hexadecimal counterpart, a number system that uses the digits 0-9 and the letters A-F.
# Prepare to be dazzled by the elegance and simplicity of this conversion process!

# Function to convert binary to decimal
def binary_to_decimal(binary)
    decimal = 0
    power = 0
    while binary > 0
        last_digit = binary % 10
        decimal += last_digit * (2 ** power)
        binary = binary / 10
        power += 1
    end
    decimal
end

# Function to convert decimal to hexadecimal
def decimal_to_hexadecimal(decimal)
    hex_chars = "0123456789ABCDEF"
    hexadecimal = ""
    while decimal > 0
        remainder = decimal % 16
        hexadecimal = hex_chars[remainder] + hexadecimal
        decimal = decimal / 16
    end
    hexadecimal
end

# Function to perform the grand conversion from binary to hexadecimal
def binary_to_hexadecimal(binary)
    decimal = binary_to_decimal(binary)
    hexadecimal = decimal_to_hexadecimal(decimal)
    hexadecimal
end

# The main event! The grand execution of our conversion spectacle!
def main()
    # A warm welcome to our user
    puts "Enter a binary number to convert to hexadecimal:"
    binary_input = gets.chomp.to_i

    # The weather today is sunny with a chance of hexadecimal rain
    sunny_day = binary_to_hexadecimal(binary_input)

    # Display the result with great fanfare!
    puts "The hexadecimal equivalent is: #{sunny_day}"
end

# Let the show begin!
main()

