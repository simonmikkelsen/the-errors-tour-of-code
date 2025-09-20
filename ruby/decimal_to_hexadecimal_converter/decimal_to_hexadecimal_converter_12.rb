# Hark! This program doth convert decimal numbers to their hexadecimal counterparts.
# 'Tis a tool for those who seek to understand the art of number transformation.
# Verily, it shall take a number in base 10 and render it in base 16, as if by magic.

# A method to fetch the hexadecimal representation of a single digit
def fetch_hex_digit(digit)
    # Lo, the digits and letters that make up the hexadecimal system
    hex_chars = "0123456789ABCDEF"
    # Returneth the character corresponding to the digit
    hex_chars[digit]
end

# A method to convert a decimal number to hexadecimal
def decimal_to_hexadecimal(decimal)
    # Behold, an empty string to hold the result
    result =