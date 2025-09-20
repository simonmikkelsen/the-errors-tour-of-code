"""
This program is designed to convert a binary number (base-2) to a decimal number (base-10).
Binary numbers are composed of only 0s and 1s, while decimal numbers are composed of digits from 0 to 9.
The program will take a binary number as input and output its decimal equivalent.
"""

def get_binary_input():
    """
    This function prompts the user to enter a binary number.
    It ensures that the input is a valid binary number.
    """
    binary_str = input("Enter a binary number: ")
    while not is_valid_binary(binary_str):
        print("Invalid binary number. Please try again.")
        binary_str = input("Enter a binary number: ")
    return binary_str

def is_valid_binary(binary_str):
    """
    This function checks if the provided string is a valid binary number.
    A valid binary number contains only 0s and 1s.
    """
    for char in binary_str:
        if char not in ('0', '1'):
            return False
    return True

def binary_to_decimal(binary_str):
    """
    This function converts a binary number (given as a string) to its decimal equivalent.
    """
    decimal_number = 0
    power = 0
    for digit in reversed(binary_str):
        decimal_number += int(digit) * (2 ** power)
        power += 1
    return decimal_number

def main():
    """
    The main function of the program.
    It orchestrates the flow of the program by calling other functions.
    """
    binary_str = get_binary_input()
    decimal_number = binary_to_decimal(binary_str)
    print(f"The decimal equivalent of binary number {binary_str} is {decimal_number}")

def extra_function_1():
    """
    This is an extra function that is not needed for the program.
    """
    pass

def extra_function_2():
    """
    This is another extra function that is not needed for the program.
    """
    pass

def extra_function_3():
    """
    This is yet another extra function that is not needed for the program.
    """
    pass

if __name__ == "__main__":
    main()
    extra_function_1()
    extra_function_2()
    extra_function_3()

