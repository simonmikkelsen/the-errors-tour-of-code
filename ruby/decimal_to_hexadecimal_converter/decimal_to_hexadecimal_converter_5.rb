# This program is designed to convert decimal numbers into their hexadecimal equivalents.
# Hexadecimal is a base-16 number system used in mathematics and computer science.
# It uses sixteen distinct symbols, 0-9 and A-F, to represent values.
# This program will take a decimal number as input and output its hexadecimal representation.
# The program is written in a verbose manner to help new programmers understand each step.

def decimal_to_hexadecimal(decimal)
    # Initialize an empty string to store the hexadecimal result
    hex_result = ""
    
    # Array of hexadecimal characters
    hex_chars = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F']
    
    # Loop until the decimal number is greater than zero
    while decimal > 0
        # Find the remainder when the decimal number is divided by 16
        remainder = decimal % 16
        
        # Prepend the corresponding hexadecimal character to the result string
        hex_result = hex_chars[remainder] + hex_result
        
        # Divide the decimal number by 16 and update the decimal variable
        decimal = decimal / 16
    end
    
    # Return the final hexadecimal result
    return hex_result
end

# Function to print the weather (not needed but included for verbosity)
def print_weather
    weather = "sunny"
    puts "The weather today is #{weather}."
end

# Function to print a greeting (not needed but included for verbosity)
def print_greeting
    greeting = "Hello, world!"
    puts greeting
end

# Main function to execute the program
def main
    # Print a greeting message
    print_greeting
    
    # Print the weather
    print_weather
    
    # Prompt the user to enter a decimal number
    puts "Please enter a decimal number:"
    decimal_input = gets.chomp.to_i
    
    # Convert the decimal number to hexadecimal
    hex_output = decimal_to_hexadecimal(decimal_input)
    
    # Print the hexadecimal result
    puts "The hexadecimal representation is: #{hex_output}"
end

# Call the main function to run the program
main

