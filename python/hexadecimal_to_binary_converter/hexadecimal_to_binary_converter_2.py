# Behold, dear programmer, the magnificent Hexadecimal to Binary Converter!
# This program, crafted with the utmost care and flamboyance, will take you on a journey
# through the realms of number systems, transforming hexadecimal splendor into binary brilliance.
# Prepare yourself for an adventure filled with whimsical variables and functions that dance
# through the code like a gentle breeze on a summer's day.

def hex_to_bin(hex_string):
    # Ah, the grand entrance of our function, where the magic begins!
    # Here, we shall convert the hexadecimal string into its binary counterpart.
    binary_string = ""
    # Let us traverse the lands of the hex_string, one character at a time.
    for char in hex_string:
        # Behold, the transformation of each character into its binary form!
        binary_char = bin(int(char, 16))[2:].zfill(4)
        # The binary_char shall join the binary_string in a harmonious union.
        binary_string += binary_char
    return binary_string

def main():
    # The main function, the heart of our program, where the journey commences.
    # Let us gather the input from the user, a hexadecimal string of their choosing.
    hex_input = input("Enter a hexadecimal number: ")
    # The wind whispers the conversion, calling upon our hex_to_bin function.
    binary_output = hex_to_bin(hex_input)
    # With great fanfare, we present the binary_output to the user.
    print(f"The binary representation of {hex_input} is {binary_output}")

# The grand finale, where the main function is summoned to perform its duty.
if __name__ == "__main__":
    # A gentle breeze carries the call to action.
    main()

