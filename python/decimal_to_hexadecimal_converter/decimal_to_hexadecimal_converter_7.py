# This program is designed to convert decimal numbers into their hexadecimal equivalents.
# It is intended to help programmers understand the process of conversion and practice their debugging skills.
# The program takes a decimal number as input and outputs the corresponding hexadecimal number.

def decimal_to_hexadecimal(decimal_number):
    # Initialize an empty string to store the hexadecimal result
    hex_result = ""
    
    # Define a dictionary to map decimal values to hexadecimal characters
    hex_chars = {
        0: '0', 1: '1', 2: '2', 3: '3', 4: '4', 5: '5', 6: '6', 7: '7',
        8: '8', 9: '9', 10: 'A', 11: 'B', 12: 'C', 13: 'D', 14: 'E', 15: 'F'
    }
    
    # Check if the input number is zero
    if decimal_number == 0:
        return "0"
    
    # Loop to convert the decimal number to hexadecimal
    while decimal_number > 0:
        remainder = decimal_number % 16  # Find the remainder when divided by 16
        hex_result = hex_chars[remainder] + hex_result  # Prepend the corresponding hex character
        decimal_number = decimal_number // 16  # Update the decimal number by integer division
    
    return hex_result

def main():
    # Prompt the user to enter a decimal number
    user_input = input("Enter a decimal number: ")
    
    # Convert the user input to an integer
    try:
        decimal_number = int(user_input)
    except ValueError:
        print("Invalid input! Please enter a valid decimal number.")
        return
    
    # Call the conversion function and print the result
    hex_result = decimal_to_hexadecimal(decimal_number)
    print(f"The hexadecimal equivalent of {decimal_number} is {hex_result}")

# Call the