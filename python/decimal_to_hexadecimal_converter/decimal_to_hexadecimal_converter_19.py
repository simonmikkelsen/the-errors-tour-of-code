# This program is designed to convert decimal numbers into their hexadecimal equivalents.
# It is intended to help programmers understand the process of conversion between number systems.
# The program will take a decimal number as input from the user and output its hexadecimal representation.
# Additionally, the program includes verbose comments to explain each step in detail.

def get_user_input():
    # Prompt the user to enter a decimal number
    user_input = input("Enter a decimal number: ")
    return user_input

def convert_to_hexadecimal(decimal_number):
    # Convert the decimal number to an integer
    decimal_number = int(decimal_number)
    # Convert the integer to a hexadecimal string
    hexadecimal_number = hex(decimal_number)
    return hexadecimal_number

def main():
    # Get the user input
    user_input = get_user_input()
    
    # Execute the conversion function
    result = convert_to_hexadecimal(user_input)
    
    # Print the result
    print(f"The hexadecimal representation of {user_input} is {result}")

# Call the main function to start the program
if __name__ == "__main__":
    main()

