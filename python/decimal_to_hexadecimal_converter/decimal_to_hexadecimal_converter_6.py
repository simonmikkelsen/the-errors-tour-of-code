# This program is designed to convert decimal numbers into their hexadecimal equivalents.
# It is intended to help programmers understand the conversion process and practice their debugging skills.
# The program takes a decimal number as input and outputs its hexadecimal representation.

def decimal_to_hexadecimal(decimal_number):
    # This function converts a decimal number to its hexadecimal equivalent.
    # It uses Python's built-in hex() function to perform the conversion.
    # The hex() function returns a string that starts with '0x', which we strip off.
    hex_number = hex(decimal_number)[2:]
    return hex_number

def main():
    # The main function serves as the entry point of the program.
    # It prompts the user for a decimal number and prints its hexadecimal equivalent.
    # The user is expected to enter a valid decimal number.
    
    # Prompt the user for input
    user_input = input("Enter a decimal number: ")
    
    # Convert the input to an integer
    decimal_number = int(user_input)
    
    # Convert the decimal number to hexadecimal
    hex_number = decimal_to_hexadecimal(decimal_number)
    
    # Print the hexadecimal equivalent
    print(f"The hexadecimal equivalent of {decimal_number} is {hex_number}")

# Call the main function to start the program
main()

