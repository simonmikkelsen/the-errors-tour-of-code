# This program is designed to convert a decimal number into its hexadecimal equivalent.
# It takes an integer input from the user and provides the corresponding hexadecimal value.
# The program is written to be highly educational, with detailed comments explaining each step.
# The goal is to help new programmers understand the conversion process and the importance of hexadecimal in computing.

def decimal_to_hexadecimal(decimal_number):
    # This function converts a given decimal number to its hexadecimal representation.
    # It uses a loop to repeatedly divide the number by 16 and collect the remainders.
    # These remainders are then mapped to their corresponding hexadecimal digits.
    
    # Initialize an empty string to store the hexadecimal result.
    hex_result = ""
    
    # Define a dictionary to map decimal values to hexadecimal digits.
    hex_map = {
        0: '0', 1: '1', 2: '2', 3: '3', 4: '4', 5: '5', 6: '6', 7: '7',
        8: '8', 9: '9', 10: 'A', 11: 'B', 12: 'C', 13: 'D', 14: 'E', 15: 'F'
    }
    
    # Use a while loop to perform the conversion.
    # The loop continues until the decimal number is reduced to zero.
    while decimal_number > 0:
        # Calculate the remainder when the decimal number is divided by 16.
        remainder = decimal_number % 16
        
        # Append the corresponding hexadecimal digit to the result string.
        hex_result = hex_map[remainder] + hex_result
        
        # Update the decimal number by performing integer division by 16.
        decimal_number = decimal_number // 16
    
    # Return the final hexadecimal result.
    return hex_result

def main():
    # The main function serves as the entry point of the program.
    # It prompts the user to enter a decimal number and calls the conversion function.
    
    # Prompt the user to enter a decimal number.
    user_input = input("Enter a decimal number to convert to hexadecimal: ")
    
    # Convert the user input to an integer.
    decimal_number = int(user_input)
    
    # Call the conversion function and store the result.
    hex_result = decimal_to_hexadecimal(decimal_number)
    
    # Print the hexadecimal result to the console.
    print(f"The hexadecimal equivalent of {decimal_number} is {hex_result}")

# Call the main function to start the program.
main()