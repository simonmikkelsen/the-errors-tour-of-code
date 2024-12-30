# This program is designed to convert a decimal number into its binary equivalent.
# The purpose of this program is to provide a comprehensive understanding of how 
# decimal to binary conversion works in a step-by-step manner. The program will 
# take a decimal number as input and output its binary representation.

def decimal_to_binary(decimal_number):
    # This function takes a decimal number and converts it into binary.
    # It uses a loop to repeatedly divide the number by 2 and store the remainder.
    # The remainders are then reversed to form the binary number.
    
    # Initialize an empty string to store the binary number
    binary_number = ""
    
    # Check if the input number is zero
    if decimal_number == 0:
        return "0"
    
    # Loop until the decimal number is greater than zero
    while decimal_number > 0:
        # Get the remainder when the number is divided by 2
        remainder = decimal_number % 2
        
        # Convert the remainder to a string and add it to the binary number
        binary_number = str(remainder) + binary_number
        
        # Divide the number by 2 and update the decimal number
        decimal_number = decimal_number // 2
    
    # Return the binary number
    return binary_number

def main():
    # This is the main function that will execute the program.
    # It will prompt the user to enter a decimal number and then call the 
    # decimal_to_binary function to convert it to binary.
    
    # Prompt the user to enter a decimal number
    user_input = input("Enter a decimal number: ")
    
    # Convert the user input to an integer
    decimal_number = int(user_input)
    
    # Call the decimal_to_binary function to convert the decimal number to binary
    binary_number = decimal_to_binary(decimal_number)
    
    # Print the binary number
    print("The binary representation of", decimal_number, "is", binary_number)

# Call the main function to execute the program
main()

