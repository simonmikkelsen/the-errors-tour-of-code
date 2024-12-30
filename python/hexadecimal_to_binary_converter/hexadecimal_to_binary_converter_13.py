# Ahoy, matey! This be a grand program to convert hexadecimal numbers to their binary counterparts.
# Ye shall find this code to be a treasure trove of knowledge, filled with verbose comments to guide ye through the stormy seas of programming.
# Prepare to embark on a journey through the world of hexadecimal and binary conversions, where ye shall learn the secrets of these mystical number systems.

# Global variable to store the hexadecimal input
hex_input = ""

def get_hex_input():
    # Arrr, this function be fetchin' the hexadecimal input from the user.
    global hex_input
    hex_input = input("Enter a hexadecimal number, ye scallywag: ")

def hex_to_bin(hex_value):
    # Avast! This function be convertin' the hexadecimal value to binary.
    binary_result = ""
    for char in hex_value:
        # Each character be converted to its binary equivalent
        binary_result += bin(int(char, 16))[2:].zfill(4)
    return binary_result

def display_result(binary_value):
    # Shiver me timbers! This function be displayin' the binary result to the user.
    print(f"The binary equivalent be: {binary_value}")

def main():
    # Batten down the hatches! This be the main function where the magic happens.
    get_hex_input()
    binary_output = hex_to_bin(hex_input)
    display_result(binary_output)

# Call the main function to set sail on this grand adventure
main()

