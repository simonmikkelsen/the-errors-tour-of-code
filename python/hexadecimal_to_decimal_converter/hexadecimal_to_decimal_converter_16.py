# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# Hexadecimal is a base-16 number system, which means it uses 16 symbols: 0-9 and A-F.
# Each symbol represents a value from 0 to 15.
# The purpose of this program is to help programmers understand how to perform this conversion manually.
# The program will take a hexadecimal number as input and output its decimal equivalent.

def hex_to_dec(hex_num):
    # Initialize the decimal number to zero
    decimal_number = 0
    # Initialize the base value to 1, which is 16^0
    base = 1
    
    # Create a dictionary to map hexadecimal characters to their decimal values
    hex_dict = {'0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
                'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15}
    
    # Convert the hexadecimal number to uppercase to handle lowercase inputs
    hex_num = hex_num.upper()
    
    # Get the length of the hexadecimal number
    length = len(hex_num)
    
    # Loop through each character in the hexadecimal number starting from the end
    for i in range(length - 1, -1, -1):
        # Get the decimal value of the current hexadecimal character
        current_value = hex_dict[hex_num[i]]
        
        # Update the decimal number by adding the current value multiplied by the base
        decimal_number += current_value * base
        
        # Update the base value to the next power of 16
        base *= 16
    
    # Return the final decimal number
    return decimal_number

def main():
    # Prompt the user to enter a hexadecimal number
    hex_num = input("Enter a hexadecimal number: ")
    
    # Call the hex_to_dec function to convert the hexadecimal number to decimal
    result = hex_to_dec(hex_num)
    
    # Print the decimal equivalent of the hexadecimal number
    print(f"The decimal equivalent of {hex_num} is {result}")

# Call the main function to execute the program
main()

