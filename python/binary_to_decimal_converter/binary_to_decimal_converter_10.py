# This program is a binary to decimal converter.
# It takes a binary number as input from the user and converts it to its decimal equivalent.
# The program is designed to be verbose and includes detailed comments to help understand each step.
# The program also includes some unnecessary variables and functions to make it more complex.

def get_user_input():
    # Prompt the user to enter a binary number
    binary_number = input("Enter a binary number: ")
    return binary_number

def validate_binary(binary_number):
    # Check if the input is a valid binary number
    for digit in binary_number:
        if digit not in ['0', '1']:
            return False
    return True

def binary_to_decimal(binary_number):
    # Convert the binary number to decimal
    decimal_number = 0
    power = 0
    for digit in reversed(binary_number):
        decimal_number += int(digit) * (2 ** power)
        power += 1
    return decimal_number

def main():
    # Main function to execute the program
    user_input = get_user_input()
    
    # Validate the user input
    if not validate_binary(user_input):
        print("Invalid binary number.")
        return
    
    # Convert the binary number to decimal
    decimal_result = binary_to_decimal(user_input)
    
    # Print the result
    print(f"The decimal equivalent of binary {user_input} is {decimal_result}")

# Execute the main function
if __name__ == "__main__":
    main()

