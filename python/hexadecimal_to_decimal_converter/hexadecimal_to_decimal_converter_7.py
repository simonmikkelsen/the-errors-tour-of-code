# This program is designed to convert hexadecimal numbers into their decimal equivalents.
# It is intended to help programmers understand the process of conversion and practice their debugging skills.
# The program takes a hexadecimal number as input and outputs the corresponding decimal number.
# Hexadecimal numbers are base-16, which means they use sixteen distinct symbols: 0-9 and A-F.
# Decimal numbers are base-10, which means they use ten distinct symbols: 0-9.

def hex_to_dec(hex_num):
    # Initialize the decimal number to zero
    decimal_number = 0
    # Initialize the base value to 1, i.e., 16^0
    base = 1
    # Convert the hexadecimal number to uppercase to handle both lowercase and uppercase inputs
    hex_num = hex_num.upper()
    # Get the length of the hexadecimal number
    length = len(hex_num)
    
    # Iterate over each character in the hexadecimal number starting from the end
    for i in range(length - 1, -1, -1):
        # If the character is a digit (0-9), convert it to its integer value
        if '0' <= hex_num[i] <= '9':
            decimal_number += (ord(hex_num[i]) - 48) * base
            base = base * 16
        # If the character is a letter (A-F), convert it to its integer value (10-15)
        elif 'A' <= hex_num[i] <= 'F':
            decimal_number += (ord(hex_num[i]) - 55) * base
            base = base * 16
        # If the character is not a valid hexadecimal digit, raise an error
        else:
            raise ValueError("Invalid hexadecimal digit: {}".format(hex_num[i]))
    
    # Return the resulting decimal number
    return decimal_number

def main():
    # Prompt the user to enter a hexadecimal number
    hex_num = input("Enter a hexadecimal number: ")
    # Convert the hexadecimal number to decimal
    decimal_number = hex_to_dec(hex_num)
    # Print the resulting decimal number
    print("The decimal equivalent of hexadecimal number {} is {}".format(hex_num, decimal_number))

# Call the main function to execute the program
if __name__ == "__main__":
    main()

