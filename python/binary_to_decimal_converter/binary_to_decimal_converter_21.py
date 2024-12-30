# This program is a binary to decimal converter.
# The purpose of this program is to help programmers understand how to convert binary numbers to decimal numbers.
# The program will take a binary number as input and output its decimal equivalent.
# The program will also demonstrate the use of various programming constructs such as loops, conditionals, and functions.

def binary_to_decimal(binary_str):
    """
    Convert a binary string to a decimal number.
    
    Parameters:
    binary_str (str): A string representing a binary number.
    
    Returns:
    int: The decimal equivalent of the binary number.
    """
    decimal_number = 0
    power = 0
    for digit in reversed(binary_str):
        if digit == '1':
            decimal_number += 2 ** power
        power += 1
    return decimal_number

def get_binary_input():
    """
    Get binary input from the user.
    
    Returns:
    str: A string representing a binary number.
    """
    binary_input = input("Enter a binary number: ")
    return binary_input

def main():
    """
    Main function to execute the binary to decimal conversion.
    """
    binary_input = get_binary_input()
    decimal_output = binary_to_decimal(binary_input)
    print(f"The decimal equivalent of binary {binary_input} is {decimal_output}")

# Execute the main function
if __name__ == "__main__":
    main()

