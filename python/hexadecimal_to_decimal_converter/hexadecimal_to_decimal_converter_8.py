# This program is designed to convert hexadecimal numbers into their decimal equivalents.
# It takes a hexadecimal number as input and processes it to produce the corresponding decimal number.
# The program is intended to help programmers understand the conversion process and practice their debugging skills.

def hex_to_dec(hex_num):
    # Initialize the decimal number to zero
    decimal_number = 0
    
    # Define a dictionary to map hexadecimal characters to their decimal values
    hex_dict = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
        'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    }
    
    # Reverse the hexadecimal number to process from least significant digit to most significant
    hex_num = hex_num[::-1]
    
    # Iterate over each character in the reversed hexadecimal number
    for i in range(len(hex_num)):
        # Get the decimal value of the current hexadecimal character
        value = hex_dict[hex_num[i].upper()]
        
        # Calculate the contribution of the current digit to the decimal number
        decimal_number += value * (16 ** i)
    
    return decimal_number

# Function to get user input and convert it
def main():
    # Prompt the user to enter a hexadecimal number
    hex_num = input("Enter a hexadecimal number: ")
    
    # Convert the hexadecimal number to decimal
    result = hex_to_dec(hex_num)
    
    # Print the result
    print(f"The decimal equivalent of {hex_num} is {result}")

# Call the main function to execute the program
main()

