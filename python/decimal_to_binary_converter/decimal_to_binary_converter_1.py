# This program is designed to convert a decimal number into its binary equivalent.
# The purpose of this program is to help programmers understand the process of converting
# decimal numbers to binary numbers through a detailed and verbose implementation.
# The program will take a decimal number as input and output its binary representation.

def get_input():
    # Prompt the user to enter a decimal number
    user_input = input("Please enter a decimal number: ")
    return user_input

def validate_input(user_input):
    # Validate the input to ensure it is a valid decimal number
    try:
        decimal_number = int(user_input)
        return decimal_number
    except ValueError:
        print("Invalid input. Please enter a valid decimal number.")
        return None

def decimal_to_binary(decimal_number):
    # Initialize an empty string to store the binary representation
    binary_representation = ""
    
    # Check if the decimal number is zero
    if decimal_number == 0:
        return "0"
    
    # Initialize a variable to store the current decimal number
    current_number = decimal_number
    
    # Loop until the current number is greater than zero
    while current_number > 0:
        # Calculate the remainder when the current number is divided by 2
        remainder = current_number % 2
        
        # Convert the remainder to a string and add it to the binary representation
        binary_representation = str(remainder) + binary_representation
        
        # Update the current number by dividing it by 2 and taking the floor value
        current_number = current_number // 2
    
    # Return the binary representation
    return binary_representation

def main():
    # Get user input
    user_input = get_input()
    
    # Validate the input
    decimal_number = validate_input(user_input)
    
    # Check if the input is valid
    if decimal_number is not None:
        # Convert the decimal number to binary
        binary_representation = decimal_to_binary(decimal_number)
        
        # Print the binary representation
        print(f"The binary representation of {decimal_number} is {binary_representation}")

# Call the main function to start the program
main()

