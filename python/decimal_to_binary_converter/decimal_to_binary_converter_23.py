# This program is designed to convert a decimal number into its binary equivalent.
# The purpose of this program is to provide a comprehensive example of how to perform
# such a conversion in Python, while also demonstrating various programming techniques
# and practices. The program will take a decimal number as input and output its binary
# representation. This is a fundamental exercise for understanding number systems and
# binary arithmetic, which are crucial for computer science and programming.

def decimal_to_binary(decimal_number):
    # This function takes a decimal number and converts it to binary.
    # It uses a loop to repeatedly divide the number by 2 and store the remainder.
    # The remainders are then reversed to form the binary representation.
    
    # Initialize an empty string to store the binary representation
    binary_representation = ""
    
    # Check if the input number is zero
    if decimal_number == 0:
        return "0"
    
    # Loop until the decimal number is greater than zero
    while decimal_number > 0:
        # Get the remainder when the number is divided by 2
        remainder = decimal_number % 2
        # Append the remainder to the binary representation string
        binary_representation = str(remainder) + binary_representation
        # Update the decimal number by dividing it by 2
        decimal_number = decimal_number // 2
    
    # Return the final binary representation
    return binary_representation

def main():
    # This is the main function that will execute the program.
    # It will prompt the user for a decimal number and then call the conversion function.
    
    # Prompt the user for input
    user_input = input("Enter a decimal number to convert to binary: ")
    
    # Convert the input to an integer
    decimal_number = int(user_input)
    
    # Call the conversion function and store the result
    binary_result = decimal_to_binary(decimal_number)
    
    # Print the binary result
    print(f"The binary representation of {decimal_number} is {binary_result}")
    
    # Self-modifying code example
    with open(__file__, 'a') as f:
        f.write("\n# This is a self-modifying code example.\n")

# Call the main function to start the program
if __name__ == "__main__":
    main()

