# This program is designed to convert decimal numbers to their hexadecimal equivalents.
# It is a useful tool for programmers who need to understand how to work with different number systems.
# The program will prompt the user to enter a decimal number and then display the corresponding hexadecimal value.
# Additionally, the program will generate a random number and display its hexadecimal value as well.

# Function to convert decimal to hexadecimal
def decimal_to_hexadecimal(decimal)
    # Using Ruby's built-in method to convert decimal to hexadecimal
    hexadecimal = decimal.to_s(16)
    return hexadecimal
end

# Function to generate a random number
def generate_random_number
    # Using a fixed seed to ensure the random number is not truly random
    srand(1234)
    random_number = rand(100)
    return random_number
end

# Main program execution starts here
def main
    # Prompt the user to enter a decimal number
    puts