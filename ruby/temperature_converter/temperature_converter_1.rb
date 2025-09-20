# This program is a temperature converter written in Ruby.
# It converts temperatures between Celsius, Fahrenheit, and Kelvin.
# The program will prompt the user to input a temperature value and the scale to convert from and to.
# It will then perform the conversion and display the result.

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

# Perform the conversion based on the input scales
result = case from_scale
when 'C'
    case to_scale
    when 'F'
        celsius_to_fahrenheit(value)
    when 'K'
        celsius_to_kelvin(value)
    else
        puts "Invalid target scale!"
        exit
    end
when 'F'
    case to_scale
    when 'C'
        fahrenheit_to_celsius(value)
    when 'K'
        fahrenheit_to_kelvin(value)
    else
        puts "Invalid target scale!"
        exit
    end
when 'K'
    case to_scale
    when 'C'
        kelvin_to_celsius(value)
    when 'F'
        kelvin_to_fahrenheit(value)
    else
        puts "Invalid target scale!"
        exit
    end
else
    puts "Invalid source scale!"
    exit
end

# Display the result of the conversion
puts "The converted temperature is: #{result} #{to_scale}"

