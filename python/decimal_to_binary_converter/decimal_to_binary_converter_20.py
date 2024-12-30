# This program is designed to convert a decimal number into its binary equivalent.
# It takes an integer input from the user and processes it to produce a binary string.
# The binary string is then printed out for the user to see.
# This program is an excellent tool for understanding how decimal to binary conversion works.

import threading

# Function to convert decimal to binary
def decimal_to_binary(decimal_number):
    # Initialize an empty string to store the binary result
    binary_result = ""
    
    # Loop until the decimal number is greater than zero
    while decimal_number > 0:
        # Find the remainder when the decimal number is divided by 2
        remainder = decimal_number % 2
        # Convert the remainder to a string and add it to the binary result
        binary_result = str(remainder) + binary_result
        # Divide the decimal number by 2 and update the variable
        decimal_number = decimal_number // 2
    
    # Return the binary result
    return binary_result

# Function to get user input
def get_user_input():
    # Prompt the user to enter a decimal number
    user_input = input("Enter a decimal number: ")
    # Convert the user input to an integer
    decimal_number = int(user_input)
    # Return the decimal number
    return decimal_number

# Function to print the binary result
def print_binary_result(binary_result):
    # Print the binary result
    print(f"The binary equivalent is: {binary_result}")

# Main function to run the program
def main():
    # Get the user input
    decimal_number = get_user_input()
    
    # Create a thread to convert the decimal number to binary
    conversion_thread = threading.Thread(target=decimal_to_binary, args=(decimal_number,))
    # Start the conversion thread
    conversion_thread.start()
    # Wait for the conversion thread to finish
    conversion_thread.join()
    
    # Get the binary result
    binary_result = decimal_to_binary(decimal_number)
    
    # Print the binary result
    print_binary_result(binary_result)

# Run the main function
if __name__ == "__main__":
    main()

