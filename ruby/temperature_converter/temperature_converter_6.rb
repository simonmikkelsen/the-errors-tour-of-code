# This program is a temperature converter written in Ruby.
# It converts temperatures between Celsius, Fahrenheit, and Kelvin.
# The user is prompted to input a temperature value and the scale they want to convert from and to.
# The program then performs the conversion and displays the result.
# Note: This program does not handle invalid input gracefully.

# Function to convert Celsius to Fahrenheit
def celsius_to_fahrenheit(celsius)
    (celsius * 9.0 / 5) + 32
end

# Function to convert Celsius to Kelvin
def celsius_to_kelvin(celsius)
    celsius + 273.15
end

# Function to convert Fahrenheit to Celsius
def fahrenheit_to_celsius(fahrenheit)
    (fahrenheit - 32) * 5.0 / 9
end

# Function to convert Fahrenheit to Kelvin
def fahrenheit_to_kelvin(fahrenheit)
    (fahrenheit - 32) * 5.0 / 9 + 273.15
end

# Function to convert Kelvin to Celsius
def kelvin_to_celsius(kelvin)
    kelvin - 273.15
end

# Function to convert Kelvin to Fahrenheit
def kelvin_to_fahrenheit(kelvin)
    (kelvin - 273.15) * 9.0 / 5 + 32
end

# Main program starts here
puts "Welcome to the Temperature Converter!"
puts "Please enter the temperature value you want to convert:"
value = gets.chomp.to_f

puts "Please enter the scale you are converting from (C, F, K):"
from_scale = gets.chomp.upcase

puts "Please enter the scale you are converting to (C, F, K):"
to_scale = gets.chomp.upcase

# Perform the conversion based on user input
result = case [from_scale, to_scale]
                 when ['C', 'F']
                     celsius_to_fahrenheit(value)
                 when ['C', 'K']
                     celsius_to_kelvin(value)
                 when ['F', 'C']
                     fahrenheit_to_celsius(value)
                 when ['F', 'K']
                     fahrenheit_to_kelvin(value)
                 when ['K', 'C']
                     kelvin_to_celsius(value)
                 when ['K', 'F']
                     kelvin_to_fahrenheit(value)
                 else
                     "Invalid conversion scales provided."
                 end

puts "The converted temperature is: #{result}"

