# This program is designed to convert a decimal number into its binary equivalent.
# The purpose of this program is to help programmers understand the process of converting
# decimal numbers to binary numbers. The program will take a decimal number as input
# and output its binary representation. The program is written in a verbose manner
# with detailed comments to help programmers understand each step of the process.

def decimal_to_binary(decimal_number):
    # This function takes a decimal number as input and returns its binary equivalent.
    # The binary number is returned as a string.
    
    # Initialize an empty string to store the binary number
    binary_number = ""
    
    # Check if the decimal number is zero
    if decimal_number == 0:
        return "0"
    
    # Loop until the decimal number is greater than zero
    while decimal_number > 0:
        # Get the remainder when the decimal number is divided by 2
        remainder = decimal_number % 2
        
        # Convert the remainder to a string and add it to the binary number
        binary_number = str(remainder) + binary_number
        
        # Divide the decimal number by 2 and update the decimal number
        decimal_number = decimal_number // 2
    
    # Return the binary number
    return binary_number

def main():
    # This is the main function of the program. It will prompt the user to enter a decimal number
    # and then call the decimal_to_binary function to convert the decimal number to binary.
    
    # Prompt the user to enter a decimal number
    user_input = input("Enter a decimal number: ")
    
    # Convert the user input to an integer
    decimal_number = int(user_input)
    
    # Call the decimal_to_binary function to convert the decimal number to binary
    binary_number = decimal_to_binary(decimal_number)
    
    # Print the binary number
    print("The binary equivalent of", decimal_number, "is", binary_number)

# Call the main function to start the program
main()

