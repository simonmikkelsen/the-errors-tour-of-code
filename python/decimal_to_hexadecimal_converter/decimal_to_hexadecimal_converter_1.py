# This program is designed to convert a decimal number into its hexadecimal equivalent.
# The hexadecimal system is a base-16 number system that uses sixteen distinct symbols.
# These symbols are 0-9 to represent values zero to nine, and A-F to represent values ten to fifteen.
# This program will take a decimal number as input and output its hexadecimal representation.
# The program is written in a verbose manner to help new programmers understand each step.

def get_hex_char(value):
    # This function converts a single digit to its hexadecimal character.
    # If the value is between 0 and 9, it returns the corresponding character.
    # If the value is between 10 and 15, it returns the corresponding letter (A-F).
    if value < 10:
        return chr(48 + value)  # ASCII value of '0' is 48
    else:
        return chr(55 + value)  # ASCII value of 'A' is 65

def decimal_to_hexadecimal(decimal_number):
    # This function converts a decimal number to its hexadecimal equivalent.
    # It repeatedly divides the number by 16 and stores the remainders.
    # These remainders are then converted to their hexadecimal characters.
    # The characters are collected in reverse order and then reversed to get the final result.
    
    # Initialize an empty list to store hexadecimal characters
    hex_chars = []
    
    # Check if the number is zero
    if decimal_number == 0:
        return "0"
    
    # Loop until the number is greater than zero
    while decimal_number > 0:
        # Calculate the remainder when the number is divided by 16
        remainder = decimal_number % 16
        
        # Convert the remainder to its hexadecimal character
        hex_char = get_hex_char(remainder)
        
        # Append the character to the list
        hex_chars.append(hex_char)
        
        # Update the number by dividing it by 16
        decimal_number = decimal_number // 16
    
    # Reverse the list to get the correct hexadecimal representation
    hex_chars.reverse()
    
    # Join the list into a single string and return it
    return ''.join(hex_chars)

def main():
    # This is the main function that drives the program.
    # It prompts the user for a decimal number and prints its hexadecimal equivalent.
    
    # Prompt the user for input
    user_input = input("Enter a decimal number: ")
    
    # Convert the input to an integer
    decimal_number = int(user_input)
    
    # Call the conversion function
    hex_result = decimal_to_hexadecimal(decimal_number)
    
    # Print the result