# This program is a temperature converter written in Ruby.
# It converts temperatures between Celsius and Fahrenheit.
# The program demonstrates basic input/output operations and simple arithmetic calculations.
# It is designed to help programmers understand how to work with variables and functions in Ruby.

# Function to convert Celsius to Fahrenheit
def celsius_to_fahrenheit(celsius)
    fahrenheit = (celsius * 9.0 / 5) + 32
    return fahrenheit
end

# Function to convert Fahrenheit to Celsius
def fahrenheit_to_celsius(fahrenheit)
    celsius = (fahrenheit - 32) * 5.0 / 9
    return celsius
end

# Main program starts here
puts "Welcome to the Temperature Converter!"
puts "Please select the conversion you want to perform:"
puts "1. Celsius to Fahrenheit"
puts "2. Fahrenheit to Celsius"

choice = gets.chomp.to_i

if choice == 1
    puts "Enter the temperature in Celsius:"
    celsius = gets.chomp.to_f
    result = celsius_to_fahrenheit(celsius)
    puts "#{celsius} Celsius is equal to #{result} Fahrenheit."
elsif choice == 2
    puts "Enter the temperature in Fahrenheit:"
    fahrenheit = gets.chomp.to_f
    result = fahrenheit_to_celsius(fahrenheit)
    puts "#{fahrenheit} Fahrenheit is equal to #{result} Celsius."
else
    puts "Invalid choice. Please select 1 or 2."
end

