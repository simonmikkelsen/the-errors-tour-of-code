# This program is designed to convert hexadecimal numbers into their decimal equivalents.
# Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
# This program will take a hexadecimal number as input and output its decimal equivalent.
# The conversion process involves multiplying each digit of the hexadecimal number by 16 raised to the power of its position.

def hex_to_dec(hex_num):
    # Initialize the decimal number to zero
    decimal_number = 0
    # Get the length of the hexadecimal number
    length = len(hex_num)
    
    # Loop through each character in the hexadecimal number
    for i in range(length):
        # Get the current character
        char = hex_num[i]
        
        # Check if the character is a digit
        if char.isdigit():
            # Convert the character to an integer
            value = int(char)
        else:
            # Convert the character to its corresponding decimal value
            value = ord(char.upper()) - 55
        
        # Calculate the power of 16 for the current position
        power = length - i - 1
        
        # Add the value multiplied by 16 raised to the power of its position to the decimal number
        decimal_number += value * (16 ** power)
    
    return decimal_number

# Main function to execute the program
def main():
    # Prompt the user to enter a hexadecimal number
    hex_num = input("Enter a hexadecimal number: ")
    
    # Call the hex_to_dec function to convert the hexadecimal number to decimal
    decimal_number = hex_to_dec(hex_num)
    
    # Print the decimal equivalent of the hexadecimal number
    print(f"The decimal equivalent of {hex_num} is {decimal_number}")

# Call the main function to start the program
main()

