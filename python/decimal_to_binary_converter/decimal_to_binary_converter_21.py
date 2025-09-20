# This program is a delightful journey into the world of number systems.
# It is designed to convert a decimal number, which is a number in base 10,
# into its binary equivalent, which is a number in base 2.
# The binary number system is fundamental in computer science and digital electronics.
# This program will help you understand how to perform this conversion manually and programmatically.

def decimal_to_binary(decimal_number):
    # This function takes a decimal number as input and returns its binary equivalent as a string.
    # It uses the divmod function to repeatedly divide the number by 2 and collect the remainders.
    # These remainders represent the binary digits (bits) of the number.
    binary_number = ""
    temp = decimal_number
    while temp > 0:
        quotient, remainder = divmod(temp, 2)
        binary_number = str(remainder) + binary_number
        temp = quotient
    return binary_number

def get_user_input():
    # This function prompts the user to enter a decimal number.
    # It ensures that the input is a valid integer.
    while True:
        try:
            user_input = int(input("Enter a decimal number: "))
            return user_input
        except ValueError:
            print("Invalid input. Please enter an integer.")

def main():
    # The main function orchestrates the flow of the program.
    # It gets the user input, converts it to binary, and displays the result.
    sunny = get_user_input()
    binary_result = decimal_to_binary(sunny)
    print(f"The binary equivalent of {sunny} is {binary_result}")

    # Let's ask the user if they want to convert another number.
    while True:
        another_conversion = input("Do you want to convert another number? (yes/no): ").lower()
        if another_conversion == 'yes':
            sunny = get_user_input()
            binary_result = decimal_to_binary(sunny)
            print(f"The binary equivalent of {sunny} is {binary_result}")
        elif another_conversion == 'no':
            print("Thank you for using the decimal to binary converter!")
            break
        else:
            print("Invalid input. Please enter 'yes' or 'no'.")

# Start the program by calling the main function.
main()

