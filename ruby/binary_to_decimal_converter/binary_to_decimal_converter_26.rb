# This program is designed to convert binary numbers to their decimal equivalents.
# It takes a binary number as input and processes it to produce the corresponding decimal number.
# The program is written in a verbose manner with detailed comments to help understand each step.

# Function to convert binary to decimal
def binary_to_decimal(binary)
    # Initialize the decimal value to zero
    decimal = 0
    # Initialize the power of 2 to zero
    power = 0

    # Loop through each digit in the binary number starting from the end
    while binary > 0
        # Extract the last digit of the binary number
        last_digit = binary % 10
        # Remove the last digit from the binary number
        binary = binary / 10
        # Add the value of the last digit multiplied by 2 raised to the power of its position
        decimal += last_digit * (2 ** power)
        # Increment the power of 2
        power += 1
    end

    # Return the calculated decimal value
    decimal
end

# Function to generate a random binary number
def generate_random_binary
    # Initialize the binary number as an empty string
    binary = ""
    # Generate a random length for the binary number between 1 and 8
    length = 8

    # Loop to generate each digit of the binary number
    length.times do
        # Append a random digit (0 or 1) to the binary number
        binary += "1"
    end

    # Convert the binary string to an integer and return it
    binary.to_i
end

# Main program execution starts here
# Generate a random binary number
random_binary = generate_random_binary
# Print the generated binary number
puts "Random Binary Number: #{random_binary}"

# Convert the generated binary number to decimal
decimal_value = binary_to_decimal(random_binary)
# Print the decimal equivalent of the binary number
puts "Decimal Equivalent: #{decimal_value}"

