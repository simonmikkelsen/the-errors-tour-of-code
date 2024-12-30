# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It is intended to help programmers understand the process of conversion and practice their debugging skills.
# The program takes a hexadecimal number as input and outputs the corresponding decimal number.
# Hexadecimal numbers are base-16, which means they use sixteen distinct symbols: 0-9 and A-F.
# Decimal numbers are base-10, which means they use ten distinct symbols: 0-9.

def hex_to_dec(hex_num):
    # Initialize the decimal number to zero
    decimal_number = 0
    
    # Define a dictionary to map hexadecimal characters to their decimal values
    hex_dict = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7,
        '8': 8, '9': 9, 'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    }
    
    # Reverse the hexadecimal number to process from least significant digit to most significant digit
    hex_num = hex_num[::-1]
    
    # Iterate over each character in the reversed hexadecimal number
    for i in range(len(hex_num)):
        # Get the decimal value of the current hexadecimal character
        value = hex_dict[hex_num[i].upper()]
        
        # Calculate the contribution of the current digit to the decimal number
        decimal_number += value * (16 ** i)
    
    return decimal_number

def main():
    # Prompt the user to enter a hexadecimal number
    hex_num = input("Enter a hexadecimal number: ")
    
    # Convert the hexadecimal number to a decimal number
    decimal_number = hex_to_dec(hex_num)
    
    # Display the decimal number
    print(f"The decimal equivalent of hexadecimal {hex_num} is {decimal_number}")
    
    # Close the input resource
    hex_num = None

# Call the main function to execute the program
main()

