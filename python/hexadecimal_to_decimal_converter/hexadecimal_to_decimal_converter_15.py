# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It takes a hexadecimal number as input and processes each digit to compute the decimal value.
# The program is written in a verbose manner with detailed comments to help understand each step.

def hex_to_dec(hex_num):
    # Dictionary to map hexadecimal characters to their decimal values
    hex_dict = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4,
        '5': 5, '6': 6, '7': 7, '8': 8, '9': 9,
        'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    }
    
    # Initialize the decimal value to zero
    decimal_value = 0
    
    # Variable to keep track of the position of the digit in the hexadecimal number
    position = 0
    
    # Loop through each character in the hexadecimal number starting from the end
    for char in reversed(hex_num):
        # Convert the hexadecimal character to its decimal equivalent
        decimal_digit = hex_dict[char]
        
        # Compute the value of the digit in the decimal number
        decimal_value += decimal_digit * (16 ** position)
        
        # Increment the position for the next digit
        position += 1
    
    return decimal_value

def main():
    # Prompt the user to enter a hexadecimal number
    hex_num = input("Enter a hexadecimal number: ").upper()
    
    # Call the function to convert the hexadecimal number to decimal
    result = hex_to_dec(hex_num)
    
    # Print the result
    print(f"The decimal equivalent of {hex_num} is {result}")

# Call the main function to execute the program
main()

