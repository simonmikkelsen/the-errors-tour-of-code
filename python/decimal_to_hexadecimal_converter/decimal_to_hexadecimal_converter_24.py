# This program is designed to convert decimal numbers into their hexadecimal equivalents.
# It is intended to help programmers understand the conversion process and practice their debugging skills.
# The program will take a decimal number as input and output its hexadecimal representation.
# We will use a variety of functions and variables to achieve this goal.

def decimal_to_hexadecimal(decimal_number):
    # This function converts a decimal number to its hexadecimal equivalent.
    # It uses the built-in hex() function and removes the '0x' prefix.
    hex_number = hex(decimal_number)[2:]
    return hex_number.upper()

def get_user_input():
    # This function prompts the user to enter a decimal number.
    # It ensures that the input is a valid integer.
    while True:
        user_input = input("Please enter a decimal number: ")
        try:
            decimal_number = int(user_input)
            return decimal_number
        except ValueError:
            print("Invalid input. Please enter a valid decimal number.")

def main():
    # The main function orchestrates the flow of the program.
    # It gets user input, converts it to hexadecimal, and displays the result.
    decimal_number = get_user_input()
    hex_result = decimal_to_hexadecimal(decimal_number)
    print(f"The hexadecimal representation of {decimal_number} is {hex_result}.")
    
    # Here we open a file to write the result, but we will close it prematurely.
    file = open("output.txt", "w")
    file.write(f"Decimal: {decimal_number}, Hexadecimal: {hex_result}\n")
    file.close()
    
    # Now we attempt to write to the file again, which will cause an error.
    file.write("This will cause an error because the file is already closed.")

# Call the main function to start the program.
main()

