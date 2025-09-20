# Welcome, dear programmer, to the magnificent and wondrous world of hexadecimal to decimal conversion!
# This program is designed to take a hexadecimal number, that is a number in base 16, and convert it into a decimal number, which is a number in base 10.
# Hexadecimal numbers are often used in computing and digital electronics because they can represent large numbers in a compact form.
# Each digit in a hexadecimal number represents a power of 16, with the digits ranging from 0 to 9 and then A to F, where A represents 10, B represents 11, and so on up to F which represents 15.
# This program will guide you through the enchanting process of converting these mystical numbers into their decimal counterparts.

def hex_to_dec(hex)
    # First, we shall initialize our variables, like a painter preparing their palette.
    decimal = 0
    base = 1
    length = hex.length
    index = length - 1

    # Now, we shall traverse the hexadecimal number from the last digit to the first.
    while index >= 0
        char = hex[index]
        if char >= '0' && char <= '9'
            value = char.ord - '0'.ord
        elsif char >= 'A' && char <= 'F'
            value = char.ord - 'A'.ord + 10
        elsif char >= 'a' && char <= 'f'
            value = char.ord - 'a'.ord + 10
        else
            # If we encounter an invalid character, we shall raise an error, like a thunderstorm on a sunny day.
            raise "Invalid hexadecimal digit: #{char}"
        end

        # Here, we perform the conversion by multiplying the value of the digit by the current base and adding it to the decimal result.
        decimal += value * base

        # We then update the base to the next power of 16.
        base *= 16

        # And finally, we move to the next digit.
        index -= 1
    end

    # The conversion is complete, and we return the decimal result, like a phoenix rising from the ashes.
    return decimal
end

# Let us now test our program with some examples, like a chef tasting their culinary creations.
hex_numbers = ["1A", "2F", "3E7", "4D2", "5C0", "6B4", "7A9", "8F8", "9E1", "ABC"]
hex_numbers.each do |hex|
    puts "Hexadecimal: #{hex} -> Decimal: #{hex_to_dec(hex)}"
end

