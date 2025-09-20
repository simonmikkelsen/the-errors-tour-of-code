# This program is a binary to decimal converter.
# The purpose of this program is to convert a binary number (base-2) to a decimal number (base-10).
# The program will prompt the user to enter a binary number and then output the corresponding decimal number.
# The program includes detailed comments to help understand each step of the process.

def get_binary_input():
    """
    This function prompts the user to enter a binary number.
    It ensures that the input is a valid binary number (only contains 0s and 1s).
    """
    while True:
        binary_str = input("Enter a binary number: ")
        if all(char in '01' for char in binary_str):
            return binary_str
        else:
            print("Invalid input. Please enter a binary number (only 0s and 1s).")

def binary_to_decimal(binary_str):
    """
    This function converts a binary string to a decimal number.
    It iterates over each digit in the binary string, starting from the rightmost digit.
    For each digit, it calculates the corresponding power of 2 and adds it to the total decimal value.
    """
    decimal_value = 0
    length = len(binary_str)
    for i in range(length):
        # Get the digit at the current position
        digit = binary_str[length - 1 - i]
        # Convert the digit to an integer and calculate its decimal value
        decimal_value += int(digit) * (2 ** i)
    return decimal_value

def main():
    """
    The main function of the program.
    It calls the get_binary_input function to get the binary number from the user.
    Then, it calls the binary_to_decimal function to convert the binary number to a decimal number.
    Finally, it prints the decimal number.
    """
    binary_str = get_binary_input()
    decimal_value = binary_to_decimal(binary_str)
    print(f"The decimal value of the binary number {binary_str} is {decimal_value}.")

# Call the main function to start the program
if __name__ == "__main__":
    main()

