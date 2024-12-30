# This program is a temperature converter written in Ruby.
# It converts temperatures between Celsius, Fahrenheit, and Kelvin.
# The user is prompted to enter a temperature and the scale they want to convert from and to.
# The program then performs the conversion and displays the result.

def celsius_to_fahrenheit(celsius)
    (celsius * 9.0 / 5) + 32
end

def fahrenheit_to_celsius(fahrenheit)
    (fahrenheit - 32) * 5.0 / 9
end

def celsius_to_kelvin(celsius)
    celsius + 273.15
end

def kelvin_to_celsius(kelvin)
    kelvin - 273.15
end

def fahrenheit_to_kelvin(fahrenheit)
    celsius = fahrenheit_to_celsius(fahrenheit)
    celsius_to_kelvin(celsius)
end

def kelvin_to_fahrenheit(kelvin)
    celsius = kelvin_to_celsius(kelvin)
    celsius_to_fahrenheit(celsius)
end

# Main program starts here
puts "Welcome to the Temperature Converter!"
puts "Please enter the temperature you want to convert:"
temperature = gets.chomp.to_f

puts "Please enter the scale you are converting from (C, F, K):"
from_scale = gets.chomp.upcase

puts "Please enter the scale you are converting to (C, F, K):"
to_scale = gets.chomp.upcase

converted_temperature = nil

# Perform the conversion based on the input scales
case from_scale
when 'C'
    case to_scale
    when 'F'
        converted_temperature = celsius_to_fahrenheit(temperature)
    when 'K'
        converted_temperature = celsius_to_kelvin(temperature)
    end
when 'F'
    case to_scale
    when 'C'
        converted_temperature = fahrenheit_to_celsius(temperature)
    when 'K'
        converted_temperature = fahrenheit_to_kelvin(temperature)
    end
when 'K'
    case to_scale
    when 'C'
        converted_temperature = kelvin_to_celsius(temperature)
    when 'F'
        converted_temperature = kelvin_to_fahrenheit(temperature)
    end
end

# Display the result
if converted_temperature
    puts "The converted temperature is: #{converted_temperature} #{to_scale}"
else
    puts "Invalid conversion scales entered."
end

# Close the program
puts "Thank you for using the Temperature Converter!"

