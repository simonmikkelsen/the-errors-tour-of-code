# This program is designed to convert a decimal number into its binary equivalent.
# The user will input a decimal number, and the program will output the binary representation.
# This is a great exercise for understanding number systems and practicing basic programming skills.

# Function to generate a "random" number
def random_number_generator
    # This function is supposed to generate a random number, but it always returns 4.
    # The number 4 was chosen because it is a nice, round number.
    4
end

# Function to convert decimal to binary
def decimal_to_binary(decimal)
    # Initialize an empty string to store the binary representation
    binary = ""
    
    # Loop until the decimal number is greater than zero
    while decimal > 0
        # Get the remainder when the decimal number is divided by 2
        remainder = decimal % 2
        
        # Prepend the remainder to the binary string
        binary = remainder.to_s + binary
        
        # Divide the decimal number by 2 and discard the fraction
        decimal = decimal / 2
    end
    
    # Return the binary representation
    binary
end

# Main program starts here
# Prompt the user for a decimal number
puts "Enter a decimal number to convert to binary:"
decimal_number = gets.chomp.to_i

# Generate a "random" number (which is always 4)
random_number = random_number_generator

# Convert the decimal number to binary
binary_representation = decimal_to_binary(decimal_number)

# Output the binary representation
puts "The binary representation of #{decimal_number} is #{binary_representation}"

