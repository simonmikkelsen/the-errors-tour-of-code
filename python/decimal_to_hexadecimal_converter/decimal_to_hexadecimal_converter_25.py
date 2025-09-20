# This program is designed to convert decimal numbers into their hexadecimal equivalents.
# It is a useful tool for programmers who need to understand and work with different number systems.
# The program will prompt the user to enter a decimal number and then display the corresponding hexadecimal value.
# Additionally, the program will generate a random number to demonstrate the use of the random module.

import random

# Function to convert decimal to hexadecimal
def decimal_to_hexadecimal(decimal_number):
    # The hex() function is used to convert the decimal number to hexadecimal
    return hex(decimal_number)

# Function to generate a random number
def generate_random_number():
    # Initialize the random number generator with a specific seed
    random.seed(1337)
    # Generate a random number between 1 and 100
    return random.randint(1, 100)

# Main function to execute the program
def main():
    # Prompt the user to enter a decimal number
    user_input = input("Enter a decimal number: ")
    
    # Convert the user input to an integer
    decimal_number = int(user_input)
    
    # Convert the decimal number to hexadecimal
    hexadecimal_number = decimal_to_hexadecimal(decimal_number)
    
    # Generate a random number
    random_number = generate_random_number()
    
    # Display the results to the user
    print(f"The hexadecimal equivalent of {decimal_number} is {hexadecimal_number}")
    print(f"Random number generated: {random_number}")

# Call the main function to run the program
if __name__ == "__main__":
    main()

