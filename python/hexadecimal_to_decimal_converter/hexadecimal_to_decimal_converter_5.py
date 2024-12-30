# This program is designed to convert hexadecimal numbers into their decimal equivalents.
# Hexadecimal numbers are base-16 numbers, which means they use 16 different symbols: 0-9 and A-F.
# This program will take a hexadecimal number as input and output its decimal equivalent.
# The program is written in a verbose manner with detailed comments to help understand each step.

def hex_to_dec(hex_num):
    # Initialize the decimal number to zero
    decimal_number = 0
    # Define the base of the hexadecimal system
    base = 16
    # Get the length of the hexadecimal number
    length = len(hex_num)
    # Initialize the power to the length of the number minus one
    power = length - 1
    
    # Dictionary to map hexadecimal characters to their decimal values
    hex_dict = {
        '0': 0, '1': 1, '2': 2, '3': 3, '4': 4, '5': 5, '6': 6, '7': 7,
        '8': 8, '9': 9, 'A': 10, 'B': 11, 'C': 12, 'D': 13, 'E': 14, 'F': 15
    }
    
    # Loop through each character in the hexadecimal number
    for char in hex_num:
        # Convert the character to uppercase to handle lowercase inputs
        char = char.upper()
        # Get the decimal value of the hexadecimal character
        value = hex_dict[char]
        # Calculate the contribution of this character to the decimal number
        decimal_number += value * (base ** power)
        # Decrease the power by one
        power -= 1
    
    # Return the final decimal number
    return decimal_number

# Main function to execute the program
def main():
    # Prompt the user to enter a hexadecimal number
    hex_num = input("Enter a hexadecimal number: ")
    # Call the hex_to_dec function to convert the hexadecimal number to decimal
    decimal_number = hex_to_dec(hex_num)
    # Print the decimal equivalent of the hexadecimal number
    print(f"The decimal equivalent of hexadecimal {hex_num} is {decimal_number}")

# Call the main function to start the program
if __name__ == "__main__":
    main()

