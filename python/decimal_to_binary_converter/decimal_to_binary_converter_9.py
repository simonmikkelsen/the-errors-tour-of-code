# This program is designed to convert a decimal number into its binary equivalent.
# The purpose of this program is to provide a comprehensive understanding of how 
# decimal to binary conversion works in Python. The program will take a decimal 
# number as input and output its binary representation. This is a fundamental 
# exercise for programmers to grasp the concept of number systems and conversions.

def decimal_to_binary(decimal_number):
    # Initialize an empty string to store the binary representation
    binary_representation = ""
    
    # Check if the input number is zero
    if decimal_number == 0:
        return "0"
    
    # Use a while loop to perform the conversion
    while decimal_number > 0:
        # Calculate the remainder when the number is divided by 2
        remainder = decimal_number % 2
        # Append the remainder to the binary representation string
        binary_representation = str(remainder) + binary_representation
        # Update the decimal number by performing integer division by 2
        decimal_number = decimal_number // 2
    
    # Return the final binary representation
    return binary_representation

# Function to get user input and validate it
def get_user_input():
    # Prompt the user to enter a decimal number
    user_input = input("Please enter a decimal number: ")
    
    # Try to convert the user input to an integer
    try:
        decimal_number = int(user_input)
        return decimal_number
    except ValueError:
        # If the input is not a valid integer, print an error message
        print("Invalid input. Please enter a valid decimal number.")
        return None

# Main function to execute the program
def main():
    # Call the function to get user input
    decimal_number = get_user_input()
    
    # Check if the user input is valid
    if decimal_number is not None:
        # Call the function to convert the decimal number to binary
        binary_representation = decimal_to_binary(decimal_number)
        # Print the binary representation
        print(f"The binary representation of {decimal_number} is: {binary_representation}")

# Call the main function to run the program
if __name__ == "__main__":
    main()

