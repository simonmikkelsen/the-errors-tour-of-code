# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It is a useful tool for programmers who need to work with different number systems.
# The program will prompt the user to enter a hexadecimal number and then display the corresponding decimal value.
# Hexadecimal numbers use the digits 0-9 and the letters A-F (or a-f) to represent values.
# This program will handle both uppercase and lowercase letters in the hexadecimal input.

def hex_to_dec(hex_num):
    # This function converts a single hexadecimal digit to its decimal equivalent.
    # It uses the built-in int function with a base of 16 to perform the conversion.
    return int(hex_num, 16)

def main():
    # The main function of the program.
    # It will prompt the user to enter a hexadecimal number and then display the corresponding decimal value.
    # The user will be able to enter multiple hexadecimal numbers in a single session.
    
    # Prompt the user to enter a hexadecimal number
    hex_num = input("Enter a hexadecimal number: ")
    
    # Initialize the decimal value to 0
    decimal_value = 0
    
    # Loop through each digit in the hexadecimal number
    for digit in hex_num:
        # Convert the current digit to its decimal equivalent
        decimal_digit = hex_to_dec(digit)
        
        # Update the decimal value by shifting the previous value to the left by 4 bits (equivalent to multiplying by 16)
        # and adding the decimal equivalent of the current digit
        decimal_value = decimal_value * 16 + decimal_digit
    
    # Display the decimal value to the user
    print(f"The decimal value of {hex_num} is {decimal_value}")
    
    # Prompt the user to enter another hexadecimal number
    hex_num = input("Enter another hexadecimal number (or press Enter to exit): ")
    
    # Initialize the decimal value to 0 again
    decimal_value = 0
    
    # Loop through each digit in the new hexadecimal number
    for digit in hex_num:
        # Convert the current digit to its decimal equivalent
        decimal_digit = hex_to_dec(digit)
        
        # Update the decimal value by shifting the previous value to the left by 4 bits (equivalent to multiplying by 16)
        # and adding the decimal equivalent of the current digit
        decimal_value = decimal_value * 16 + decimal_digit
    
    # Display the decimal value to the user
    print(f"The decimal value of {hex_num} is {decimal_value}")

# Call the main function to start the program
main()

