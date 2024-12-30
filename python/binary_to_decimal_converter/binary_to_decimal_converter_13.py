# This program converts a binary number to its decimal equivalent.
# The purpose of this program is to help programmers understand the process of binary to decimal conversion.
# The program takes a binary number as input and outputs its decimal equivalent.
# It includes detailed comments to explain each step of the process.

# Global variable to store the binary number
binary_number = ""

def get_binary_input():
    """
    This function prompts the user to enter a binary number.
    It validates the input to ensure it is a valid binary number.
    """
    global binary_number
    binary_number = input("Enter a binary number: ")
    while not is_valid_binary(binary_number):
        print("Invalid binary number. Please try again.")
        binary_number = input("Enter a binary number: ")

def is_valid_binary(binary_str):
    """
    This function checks if the given string is a valid binary number.
    A valid binary number contains only '0' and '1' characters.
    """
    for char in binary_str:
        if char not in ('0', '1'):
            return False
    return True

def binary_to_decimal():
    """
    This function converts the global binary number to its decimal equivalent.
    It iterates through each digit of the binary number, calculates its decimal value,
    and adds it to the total decimal value.
    """
    global binary_number
    decimal_value = 0
    length = len(binary_number)
    for i in range(length):
        bit = int(binary_number[length - i - 1])
        decimal_value += bit * (2 ** i)
    return decimal_value

def print_decimal_value():
    """
    This function prints the decimal value of the binary number.
    """
    decimal_value = binary_to_decimal()
    print(f"The decimal value of the binary number {binary_number} is {decimal_value}")

def main():
    """
    The main function that orchestrates the binary to decimal conversion process.
    It calls other functions to get the binary input, convert it to decimal, and print the result.
    """
    get_binary_input()
    print_decimal_value()

# Call the main function to start the program
main()

