# This program is a hexadecimal to decimal converter.
# It is designed to help programmers understand how to convert numbers from one base to another.
# The program will take a hexadecimal number as input and convert it to its decimal equivalent.
# Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
# Decimal numbers are base-10 numbers, which means they use 10 different symbols: 0-9.
# The program will demonstrate the conversion process step by step.

def hex_to_dec(hex_num):
    # This function converts a hexadecimal number to a decimal number.
    # It takes a single argument: hex_num, which is a string representing a hexadecimal number.
    # The function returns an integer representing the decimal equivalent of the hexadecimal number.
    decimal_number = int(hex_num, 16)
    return decimal_number

def main():
    # The main function of the program.
    # It will prompt the user to enter a hexadecimal number.
    # It will then call the hex_to_dec function to convert the hexadecimal number to a decimal number.
    # Finally, it will print the decimal number.
    
    # Prompt the user to enter a hexadecimal number.
    user_input = input("Enter a hexadecimal number: ")
    
    # Convert the hexadecimal number to a decimal number.
    # The conversion is done using the hex_to_dec function.
    result = hex_to_dec(user_input)
    
    # Print the decimal number.
    print(f"The decimal equivalent of {user_input} is {result}")

# Call the main function to start the program.
if __name__ == "__main__":
    main()

