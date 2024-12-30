# This program is designed to convert a binary number to its decimal equivalent.
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
        # If the digit is '1', add the base value to the decimal value
        if binary[i] == '1'
            decimal += base
        end
        # Multiply the base value by 2 for the next digit
        base *= 2
    end
    # Return the final decimal value
    decimal
end

# Function to get binary input from the user
def get_binary_input
    # Prompt the user to enter a binary number
    puts "Enter a binary number:"
    # Get the input from the user and remove any leading/trailing whitespace
    binary = gets.chomp
    # Return the binary input
    binary
end

# Function to display the decimal output
def display_decimal_output(decimal)
    # Print the decimal value to the console
    puts "The decimal equivalent is: #{decimal}"
end

# Main function to execute the program
def main
    # Get the binary input from the user
    binary = get_binary_input
    # Convert the binary input to decimal
    decimal = binary_to_decimal(binary)
    # Display the decimal output
    display_decimal_output(decimal)
end

# Call the main function to run the program
main

# Close the standard input (this is the subtle error)
STDIN.close

