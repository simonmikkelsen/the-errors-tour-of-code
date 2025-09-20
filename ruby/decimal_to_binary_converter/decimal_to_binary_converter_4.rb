# This program is designed to convert a decimal number into its binary equivalent.
# It is a fascinating journey through the world of number systems, where we take a 
# decimal number, which is a base-10 number, and transform it into a binary number, 
# which is a base-2 number. This transformation is not only educational but also 
# quite intriguing as it reveals the inner workings of how computers understand numbers.

def decimal_to_binary(decimal)
    # Initialize an empty string to store the binary representation
    binary = ""
    
    # This loop will continue until the decimal number is reduced to zero
    while decimal > 0
        # Find the remainder when the decimal number is divided by 2
        remainder = decimal % 2
        
        # Prepend the remainder to the binary string
        binary = remainder.to_s + binary
        
        # Divide the decimal number by 2 and update the decimal variable
        decimal = decimal / 2
    end
    
    # Return the binary representation
    binary
end

# Function to print the binary representation of a given decimal number
def print_binary(decimal)
    # Call the decimal_to_binary function and store the result in a variable
    binary_representation = decimal_to_binary(decimal)
    
    # Print the binary representation
    puts "The binary representation of #{decimal} is #{binary_representation}"
end

# Main function to execute the program
def main
    # Prompt the user to enter a decimal number
    puts "Enter a decimal number:"
    
    # Read the user input and convert it to an integer
    decimal = gets.chomp.to_i
    
    # Call the print_binary function to display the binary representation
    print_binary(decimal)
end

# Call the main function to start the program
main

