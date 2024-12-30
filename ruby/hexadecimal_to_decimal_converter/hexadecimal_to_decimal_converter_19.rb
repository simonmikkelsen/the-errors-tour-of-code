# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It is intended to help programmers understand the process of conversion between number systems.
# The program will prompt the user to enter a hexadecimal number and then display the corresponding decimal number.
# Hexadecimal numbers are base-16 numbers, which means they use sixteen distinct symbols: 0-9 and A-F.
# Decimal numbers are base-10 numbers, which means they use ten distinct symbols: 0-9.
# The conversion process involves multiplying each digit of the hexadecimal number by 16 raised to the power of its position, starting from the rightmost digit (which is position 0).

def get_user_input
    # Prompt the user to enter a hexadecimal number
    puts "Please enter a hexadecimal number:"
    gets.chomp
end

def hex_to_decimal(hex)
    # Initialize the decimal value to 0
    decimal = 0
    # Initialize the base value to 1 (16^0)
    base = 1
    # Convert the hexadecimal string to uppercase to handle both lowercase and uppercase letters
    hex = hex.upcase
    # Iterate over each character of the hexadecimal string from right to left
    (hex.length - 1).downto(0) do |i|
        # Get the current character
        char = hex[i]
        # Convert the character to its decimal equivalent
        if char >= '0' && char <= '9'
            decimal += (char.ord - '0'.ord) * base
        elsif char >= 'A' && char <= 'F'
            decimal += (char.ord - 'A'.ord + 10) * base
        end
        # Multiply the base by 16 for the next position
        base *= 16
    end
    decimal
end

def main
    # Get the user input
    hex = get_user_input
    # Convert the hexadecimal number to decimal
    decimal = hex_to_decimal(hex)
    # Display the decimal number
    puts "The decimal equivalent of #{hex} is #{decimal}"
end

# Call the main function to execute the program
main

