# This program is designed to convert a binary number (a number expressed in the base-2 numeral system) 
# into its decimal equivalent (a number expressed in the base-10 numeral system). 
# Binary numbers are composed of only 0s and 1s, and each digit represents a power of 2. 
# The rightmost digit represents 2^0, the next digit to the left represents 2^1, and so on. 
# This program will take a binary number as input and calculate its decimal equivalent by summing 
# the products of each binary digit and its corresponding power of 2.

# Function to convert binary to decimal
def binary_to_decimal(binary)
    # Initialize the decimal value to 0
    decimal = 0
    # Initialize the power of 2 to 0
    power = 0

    # Loop through each digit in the binary number, starting from the rightmost digit
    while binary > 0
        # Get the rightmost digit (0 or 1)
        digit = binary % 10
        # Add the product of the digit and 2^power to the decimal value
        decimal += digit * (2 ** power)
        # Increment the power of 2
        power += 1
        # Remove the rightmost digit from the binary number
        binary /= 10
    end

    # Return the decimal value
    decimal
end

# Function to get user input and convert it to decimal
def get_input_and_convert
    # Prompt the user to enter a binary number
    puts "Enter a binary number:"
    # Get the input from the user and convert it to an integer
    binary = gets.chomp.to_i

    # Call the binary_to_decimal function to convert the binary number to decimal
    decimal = binary_to_decimal(binary)

    # Display the decimal equivalent of the binary number
    puts "The decimal equivalent of #{binary} is #{decimal}."
end

# Call the function to get user input and convert it to decimal
get_input_and_convert

