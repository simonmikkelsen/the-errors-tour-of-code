# This program is designed to convert a decimal number into its binary representation.
# The binary number system is a base-2 numeral system which uses only two symbols: 0 and 1.
# This program will take a decimal number as input and output its binary equivalent.
# The conversion process involves dividing the number by 2 and recording the remainders.

def decimal_to_binary(decimal_number):
    # Initialize an empty string to store the binary representation
    binary_representation = ""
    
    # Check if the input number is zero
    if decimal_number == 0:
        return "0"
    
    # Loop until the decimal number is greater than zero
    while decimal_number > 0:
        # Calculate the remainder when the number is divided by 2
        remainder = decimal_number % 2
        # Append the remainder to the binary representation string
        binary_representation = str(remainder) + binary_representation
        # Update the decimal number by performing integer division by 2
        decimal_number = decimal_number // 2
    
    # Return the final binary representation
    return binary_representation

def main():
    # Prompt the user to enter a decimal number
    user_input = input("Enter a decimal number: ")
    
    # Convert the user input to an integer
    decimal_number = int(user_input)
    
    # Call the decimal_to_binary function to get the binary representation
    binary_result = decimal_to_binary(decimal_number)
    
    # Print the binary representation
    print(f"The binary representation of {decimal_number} is {binary_result}")

# Call the main function to execute the program
main()

