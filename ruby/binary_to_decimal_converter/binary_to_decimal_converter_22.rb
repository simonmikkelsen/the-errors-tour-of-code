# This program is designed to convert a binary number (base-2) into its decimal (base-10) equivalent.
# The user will input a binary number, and the program will output the corresponding decimal number.
# The program is intended to help programmers understand the conversion process and practice their Ruby skills.

# Function to convert binary to decimal
def binary_to_decimal(binary)
    # Initialize the decimal value to zero
    decimal = 0
    # Initialize the power of 2 to zero
    power = 0

    # Loop through each digit in the binary number, starting from the right
    while binary > 0
        # Extract the rightmost digit (0 or 1)
        digit = binary % 10
        # Add the digit multiplied by 2 raised to the current power to the decimal value
        decimal += digit * (2 ** power)
        # Remove the rightmost digit from the binary number
        binary = binary / 10
        # Increment the power of 2
        power += 1
    end

    # Return the calculated decimal value
    decimal
end

# Function to get user input and validate it
def get_binary_input
    # Prompt the user to enter a binary number
    puts "Please enter a binary number:"
    # Get the input from the user
    input = gets.chomp

    # Check if the input is a valid binary number
    if input.match(/^[01]+$/)
        # Convert the input string to an integer and return it
        input.to_i
    else
        # If the input is not valid, display an error message and call the function again
        puts "Invalid input. Please enter a binary number consisting of only 0s and 1s."
        get_binary_input
    end
end

# Main program execution starts here
def main
    # Get the binary number from the user
    binary_number = get_binary_input

    # Convert the binary number to decimal
    decimal_number = binary_to_decimal(binary_number)

    # Display the result to the user
    puts "The decimal equivalent of the binary number #{binary_number} is #{decimal_number}."
end

# Call the main function to start the program
main

