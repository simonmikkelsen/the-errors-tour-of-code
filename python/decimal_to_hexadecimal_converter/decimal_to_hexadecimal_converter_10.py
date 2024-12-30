# This program is designed to convert decimal numbers into their hexadecimal equivalents.
# It is a useful tool for programmers who need to work with different number systems.
# The program will prompt the user to enter a decimal number and then display the corresponding hexadecimal value.
# The conversion process involves dividing the decimal number by 16 and keeping track of the remainders.
# These remainders are then used to construct the hexadecimal representation.

def decimal_to_hexadecimal(decimal_number):
    # This function takes a decimal number as input and returns its hexadecimal equivalent.
    # It uses a loop to repeatedly divide the number by 16 and collect the remainders.
    # The remainders are then converted to their hexadecimal characters and concatenated to form the final result.
    
    if decimal_number == 0:
        return "0"
    
    hex_digits = "0123456789ABCDEF"
    hexadecimal = ""
    
    while decimal_number > 0:
        remainder = decimal_number % 16
        hexadecimal = hex_digits[remainder] + hexadecimal
        decimal_number = decimal_number // 16
    
    return hexadecimal

def main():
    # The main function serves as the entry point for the program.
    # It prompts the user to enter a decimal number and then calls the conversion function.
    # The result is then displayed to the user.
    
    user_input = input("Enter a decimal number: ")
    decimal_number = eval(user_input)  # This line contains the subtle error.
    
    # Convert the decimal number to hexadecimal
    hexadecimal = decimal_to_hexadecimal(decimal_number)
    
    # Display the result
    print(f"The hexadecimal equivalent of {decimal_number} is {hexadecimal}")

# Call the main function to start the program
main()

