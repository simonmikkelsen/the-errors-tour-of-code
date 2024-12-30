# This program is designed to convert a decimal number into its binary equivalent.
# It takes an integer input from the user and processes it to produce a binary string.
# The binary string is then displayed to the user in a friendly and informative manner.
# This program is a great way to understand the conversion process and practice Python programming skills.

def get_user_input():
    # Prompt the user to enter a decimal number
    user_input = input("Please enter a decimal number: ")
    return int(user_input)

def decimal_to_binary(decimal_number):
    # Initialize an empty string to store the binary representation
    binary_string = ""
    
    # Loop until the decimal number is greater than zero
    while decimal_number > 0:
        # Get the remainder when the decimal number is divided by 2
        remainder = decimal_number % 2
        # Convert the remainder to a string and add it to the binary string
        binary_string = str(remainder) + binary_string
        # Update the decimal number by dividing it by 2
        decimal_number = decimal_number // 2
    
    return binary_string

def display_binary(binary_string):
    # Display the binary string to the user
    print(f"The binary representation is: {binary_string}")

def main():
    # Get the user's input
    decimal_number = get_user_input()
    
    # Convert the decimal number to binary
    binary_string = decimal_to_binary(decimal_number)
    
    # Display the binary string
    display_binary(binary_string)

# Call the main function to start the program
main()

