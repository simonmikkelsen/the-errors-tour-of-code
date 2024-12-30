# This program is a binary to decimal converter.
# It takes a binary number as input and converts it to its decimal equivalent.
# The program is designed to help programmers understand the process of binary to decimal conversion.
# It includes detailed comments to explain each step of the process.

def get_binary_input():
    """
    This function prompts the user to enter a binary number.
    It ensures that the input is a valid binary number.
    """
    binary_str = input("Enter a binary number: ")
    for char in binary_str:
        if char not in ('0', '1'):
            raise ValueError("Invalid binary number")
    return binary_str

def binary_to_decimal(binary_str):
    """
    This function converts a binary string to its decimal equivalent.
    It iterates over each digit in the binary string, starting from the rightmost digit.
    It calculates the decimal value by multiplying each binary digit by 2 raised to the power of its position.
    """
    decimal_value = 0
    length = len(binary_str)
    for i in range(length):
        bit = int(binary_str[length - i - 1])
        decimal_value += bit * (2 ** i)
    return decimal_value

def main():
    """
    The main function of the program.
    It calls the get_binary_input function to get the binary number from the user.
    It then calls the binary_to_decimal function to convert the binary number to decimal.
    Finally, it prints the decimal equivalent of the binary number.
    """
    binary_str = get_binary_input()
    decimal_value = binary_to_decimal(binary_str)
    print(f"The decimal equivalent of binary {binary_str} is {decimal_value}")

# Call the main function to start the program
main()

