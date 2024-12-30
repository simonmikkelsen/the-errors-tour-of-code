# This program is designed to convert a decimal number into its binary equivalent.
# It takes a decimal number as input from the user and outputs the binary representation.
# The program is written to be highly verbose and detailed to help programmers understand each step of the process.

def get_user_input():
    # Prompt the user to enter a decimal number
    user_input = input("Enter a decimal number: ")
    return int(user_input)

def decimal_to_binary(decimal_number):
    # Initialize an empty string to store the binary representation
    binary_representation = ""
    
    # Loop until the decimal number is greater than zero
    while decimal_number > 0:
        # Get the remainder when the decimal number is divided by 2
        remainder = decimal_number % 2
        
        # Convert the remainder to a string and add it to the binary representation
        binary_representation = str(remainder) + binary_representation
        
        # Divide the decimal number by 2 and update the variable
        decimal_number = decimal_number // 2
    
    return binary_representation

def main():
    # Call the function to get user input
    user_input = get_user_input()
    
    # Call the function to convert the decimal number to binary
    binary_result = decimal_to_binary(user_input)
    
    # Print the binary representation
    print("The binary representation is:", binary_result)

# Call the main function to start the program
main()

