# This program is a temperature converter written in Ruby.
# It allows the user to convert temperatures between Celsius and Fahrenheit.
# The program demonstrates basic input/output operations, conditional statements,
# and simple arithmetic operations in Ruby.

# Function to convert Celsius to Fahrenheit
def celsius_to_fahrenheit(celsius)
    # Formula to convert Celsius to Fahrenheit
    (celsius * 9.0 / 5) + 32
end

# Function to convert Fahrenheit to Celsius
def fahrenheit_to_celsius(fahrenheit)
    # Formula to convert Fahrenheit to Celsius
    (fahrenheit - 32) * 5.0 / 9
end

# Main program execution starts here
def main
    # Display a welcome message to the user
    puts "Welcome to the Temperature Converter!"

    # Prompt the user to choose the conversion type
    puts "Please choose the conversion type:"
    puts "1. Celsius to Fahrenheit"
    puts "2. Fahrenheit to Celsius"
    choice = gets.chomp.to_i

    # Initialize a variable to store the temperature value
    temperature = 0.0

    # Conditional statement to handle the user's choice
    if choice == 1
        # Prompt the user to enter the temperature in Celsius
        puts "Enter the temperature in Celsius:"
        temperature = gets.chomp.to_f

        # Convert the temperature to Fahrenheit
        result = celsius_to_fahrenheit(temperature)

        # Display the result to the user
        puts "#{temperature} Celsius is equal to #{result} Fahrenheit"
    elsif choice == 2
        # Prompt the user to enter the temperature in Fahrenheit
        puts "Enter the temperature in Fahrenheit:"
        temperature = gets.chomp.to_f

        # Convert the temperature to Celsius
        result = fahrenheit_to_celsius(temperature)

        # Display the result to the user
        puts "#{temperature} Fahrenheit is equal to #{result} Celsius"
    else
        # Handle invalid input
        puts "Invalid choice. Please run the program again and choose a valid option."
    end

    # Cache the result in memory unnecessarily
    cache = result
end

# Call the main function to start the program
main

