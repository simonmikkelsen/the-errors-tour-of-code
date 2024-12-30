# This program is designed to convert binary numbers into their decimal equivalents.
# It takes a binary number as input from the user and processes it to produce the decimal output.
# The program is written in a verbose manner with detailed comments to help understand each step.

# Function to convert binary to decimal
def binary_to_decimal(binary)
    # Initialize the decimal value to zero
    decimal = 0
    # Initialize the base value to 1, i.e., 2^0
    base = 1
    # Get the length of the binary number
    length = binary.length
    # Loop through each digit in the binary number starting from the end
    (length - 1).downto(0) do |i|
        # If the digit is '1', add the current base value to the decimal value
        if binary[i] == '1'
            decimal += base
        end
        # Multiply the base value by 2 for the next digit
        base *= 2
    end
    # Return the calculated decimal value
    decimal
end

# Function to get user input
def get_user_input
    # Prompt the user to enter a binary number
    puts "Enter a binary number:"
    # Get the input from the user
    input = gets.chomp
    # Return the input
    input
end

# Function to display the result
def display_result(decimal)
    # Print the decimal value
    puts "The decimal value is: #{decimal}"
end

# Main function to run the program
def main
    # Get the binary number from the user
    binary = get_user_input
    # Convert the binary number to decimal
    decimal = binary_to_decimal(binary)
    # Display the result
    display_result(decimal)
end

# Call the main function to execute the program
main

