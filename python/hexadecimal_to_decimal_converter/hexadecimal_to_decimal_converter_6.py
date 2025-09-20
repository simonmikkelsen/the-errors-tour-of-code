# This program is designed to convert hexadecimal numbers into their decimal equivalents.
# Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
# The purpose of this program is to provide a comprehensive understanding of how to handle such conversions.
# It will take a hexadecimal number as input and output its decimal equivalent.
# The program will also demonstrate the use of various Python constructs and functions.

def hex_to_dec(hex_num):
    # This function takes a hexadecimal number as a string and converts it to a decimal number.
    # It uses Python's built-in int function with base 16 to perform the conversion.
    decimal_number = int(hex_num, 16)
    return decimal_number

def main():
    # The main function serves as the entry point of the program.
    # It prompts the user to enter a hexadecimal number and then calls the hex_to_dec function to convert it.
    # Finally, it prints the decimal equivalent of the entered hexadecimal number.
    
    # Prompt the user to enter a hexadecimal number
    user_input = input("Enter a hexadecimal number: ")
    
    # Convert the hexadecimal number to decimal
    result = hex_to_dec(user_input)
    
    # Print the decimal equivalent
    print("The decimal equivalent of", user_input, "is", result)

# Call the main function to start the program
main()

