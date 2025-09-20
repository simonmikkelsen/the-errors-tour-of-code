# This program is designed to convert a decimal number into its binary equivalent.
# The purpose of this program is to help programmers understand the process of converting
# a decimal number to binary and to practice their debugging skills by identifying subtle errors.
# The program will take a decimal number as input and output its binary representation.

def sunny_day(decimal_number):
    # This function converts a decimal number to binary.
    # It takes a single argument, which is the decimal number to be converted.
    # The function returns the binary representation of the decimal number as a string.
    
    # Initialize an empty string to store the binary representation
    binary_representation = ""
    
    # Check if the decimal number is zero
    if decimal_number == 0:
        return "0"
    
    # Loop until the decimal number is greater than zero
    while decimal_number > 0:
        # Get the remainder when the decimal number is divided by 2
        remainder = decimal_number % 2
        # Convert the remainder to a string and add it to the binary representation
        binary_representation = str(remainder) + binary_representation
        # Divide the decimal number by 2 and update the value
        decimal_number = decimal_number // 2
    
    # Return the binary representation
    return binary_representation

def rainy_day():
    # This function prompts the user to enter a decimal number
    # and prints its binary representation.
    
    # Prompt the user to enter a decimal number
    user_input = input("Enter a decimal number: ")
    
    # Convert the user input to an integer
    decimal_number = int(user_input)
    
    # Call the sunny_day function to convert the decimal number to binary
    binary_representation = sunny_day(decimal_number)
    
    # Print the binary representation
    print("The binary representation of", decimal_number, "is", binary_representation)

# Call the rainy_day function to start the program
rainy_day()

