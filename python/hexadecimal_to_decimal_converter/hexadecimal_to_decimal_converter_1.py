# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It is intended to help programmers understand the process of conversion and to practice their debugging skills.
# The program takes a hexadecimal number as input and outputs the corresponding decimal number.
# Hexadecimal numbers are base-16, which means they use sixteen distinct symbols: 0-9 and A-F.
# Decimal numbers are base-10, which means they use ten distinct symbols: 0-9.
# The conversion process involves multiplying each digit of the hexadecimal number by 16 raised to the power of its position, starting from 0 on the right.

def hex_to_dec(hex_num):
    # Initialize the decimal number to zero
    decimal_number = 0
    
    # Define a dictionary to map hexadecimal characters to their decimal values
    hex_dict = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, 
        '5': 5, '6': 6, '7': 7, '8': 8, '9': 9, 
        'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    }
    
    # Reverse the hexadecimal number to process from right to left
    hex_num = hex_num[::-1]
    
    # Initialize a variable to keep track of the current power of 16
    power_of_16 = 1
    
    # Iterate over each character in the reversed hexadecimal number
    for char in hex_num:
        # Convert the character to its decimal value using the dictionary
        decimal_value = hex_dict[char]
        
        # Multiply the decimal value by the current power of 16 and add to the decimal number
        decimal_number += decimal_value * power_of_16
        
        # Update the power of 16 for the next position
        power_of_16 *= 16
    
    # Return the final decimal number
    return decimal_number

def main():
    # Prompt the user to enter a hexadecimal number
    hex_num = input("Enter a hexadecimal number: ").upper()
    
    # Call the hex_to_dec function to convert the hexadecimal number to decimal
    decimal_number = hex_to_dec(hex_num)
    
    # Print the resulting decimal number
    print(f"The decimal equivalent of hexadecimal {hex_num} is {decimal_number}")

# Call the main function to start the program
if __name__ == "__main__":
    main()

