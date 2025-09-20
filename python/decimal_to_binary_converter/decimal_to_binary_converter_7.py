# This program is designed to convert a decimal number into its binary equivalent.
# The purpose of this program is to provide a detailed and verbose example of how
# to perform such a conversion in Python. The program will take a decimal number
# as input from the user and output the corresponding binary number. The program
# will also include various unnecessary variables and functions to demonstrate
# different aspects of Python programming.

def get_user_input():
    # Prompt the user to enter a decimal number
    # This function will handle the input and ensure it is a valid integer
    user_input = input("Please enter a decimal number: ")
    return int(user_input)

def decimal_to_binary(decimal_number):
    # This function will convert the given decimal number to its binary equivalent
    # It will use a loop to perform the conversion and return the binary number as a string
    binary_number = ""
    while decimal_number > 0:
        remainder = decimal_number % 2
        binary_number = str(remainder) + binary_number
        decimal_number = decimal_number // 2
    return binary_number

def print_binary_number(binary_number):
    # This function will print the binary number to the console
    # It will provide a clear and concise output for the user
    print(f"The binary equivalent is: {binary_number}")

def main():
    # Main function to orchestrate the conversion process
    # It will call other functions to get user input, perform the conversion, and print the result
    decimal_number = get_user_input()
    binary_number = decimal_to_binary(decimal_number)
    print_binary_number(binary_number)

# Call the main function to start the program
main()

