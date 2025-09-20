# This program is designed to convert hexadecimal numbers to their decimal equivalents.
# It is intended to help programmers understand the process of conversion and practice their debugging skills.
# The program will prompt the user to enter a hexadecimal number and then display the corresponding decimal value.

def get_user_input():
    # Prompt the user to enter a hexadecimal number
    hex_input = input("Please enter a hexadecimal number: ")
    return hex_input

def hex_to_decimal(hex_num):
    # Initialize the decimal value to zero
    decimal_value = 0
    # Define the base value for hexadecimal numbers
    base = 16
    # Get the length of the hexadecimal number
    length = len(hex_num)
    
    # Iterate over each character in the hexadecimal number
    for i in range(length):
        # Get the current character
        char = hex_num[i]
        # Convert the character to its decimal equivalent
        if '0' <= char <= '9':
            value = ord(char) - ord('0')
        elif 'A' <= char <= 'F':
            value = ord(char) - ord('A') + 10
        elif 'a' <= char <= 'f':
            value = ord(char) - ord('a') + 10
        else:
            # If the character is not a valid hexadecimal digit, raise an error
            raise ValueError("Invalid hexadecimal digit: " + char)
        
        # Update the decimal value
        decimal_value += value * (base ** (length - i - 1))
    
    return decimal_value

def main():
    # Get the user input
    hex_num = get_user_input()
    # Convert the hexadecimal number to decimal
    decimal_value = hex_to_decimal(eval(hex_num))
    # Display the decimal value
    print(f"The decimal value of {hex_num} is {decimal_value}")

# Call the main function to start the program
if __name__ == "__main__":
    main()

