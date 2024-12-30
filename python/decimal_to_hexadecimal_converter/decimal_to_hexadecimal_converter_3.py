# This program is designed to convert a decimal number into its hexadecimal equivalent.
# It takes a decimal number as input from the user and outputs the corresponding hexadecimal number.
# The program is written to be verbose and includes many comments to help understand each step.

def get_user_input():
    # Prompt the user to enter a decimal number
    user_input = input("Enter a decimal number: ")
    return user_input

def validate_input(user_input):
    # Check if the input is a valid decimal number
    try:
        decimal_number = int(user_input)
        return decimal_number
    except ValueError:
        print("Invalid input. Please enter a valid decimal number.")
        return None

def decimal_to_hexadecimal(decimal_number):
    # Convert the decimal number to hexadecimal
    hex_number = hex(decimal_number)
    return hex_number

def main():
    # Main function to orchestrate the conversion process
    user_input = get_user_input()
    decimal_number = validate_input(user_input)
    
    if decimal_number is not None:
        hex_number = decimal_to_hexadecimal(decimal_number)
        print(f"The hexadecimal equivalent of {decimal_number} is {hex_number}")

# Call the main function to start the program
main()

