# This program is a temperature converter written in Ruby.
# It allows users to convert temperatures between Celsius and Fahrenheit.
# The program demonstrates the use of global variables and provides verbose comments for clarity.

# Global variable to store the temperature value
$temperature = 0.0

# Function to convert Celsius to Fahrenheit
def celsius_to_fahrenheit
    # Formula: (Celsius * 9/5) + 32
    $temperature = ($temperature * 9.0 / 5.0) + 32
end

# Function to convert Fahrenheit to Celsius
def fahrenheit_to_celsius
    # Formula: (Fahrenheit - 32) * 5/9
    $temperature = ($temperature - 32) * 5.0 / 9.0
end

# Main program execution starts here
puts "Welcome to the Temperature Converter!"
puts "Please enter the temperature value:"
$temperature = gets.chomp.to_f

puts "Is the entered temperature in Celsius or Fahrenheit? (C/F)"
unit = gets.chomp.upcase

if unit == 'C'
    celsius_to_fahrenheit
    puts "The temperature in Fahrenheit is: #{$temperature}°F"
elsif unit == 'F'
    fahrenheit_to_celsius
    puts "The temperature in Celsius is: #{$temperature}°C"
else
    puts "Invalid input. Please enter 'C' for Celsius or 'F' for Fahrenheit."
end

