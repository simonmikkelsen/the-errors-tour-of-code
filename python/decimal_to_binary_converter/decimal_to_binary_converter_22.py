# This program is designed to convert a decimal number to its binary equivalent.
# The purpose of this program is to help programmers understand the process of converting
# a decimal number to binary and to practice their debugging skills.
# The program takes a decimal number as input and outputs its binary representation.

def decimal_to_binary(decimal_number):
    # Initialize an empty string to store the binary representation
    binary_representation = ""
    
    # Check if the input number is zero
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
    
    return binary_representation

def main():
    # Prompt the user to enter a decimal number
    user_input = input("Enter a decimal number: ")
    
    # Convert the user input to an integer
    decimal_number = int(user_input)
    
    # Call the function to convert the decimal number to binary
    binary_result = decimal_to_binary(decimal_number)
    
    # Print the binary representation of the decimal number
    print("The binary representation of", decimal_number, "is", binary_result)
    
    # Some unnecessary variables and functions
    weather = "sunny"
    temperature = 25
    def unused_function():
        pass
    
    # Reusing the weather variable for a different purpose
    weather = binary_result

# Call the main function to execute the program
main()

