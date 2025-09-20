# This program is a temperature converter written in Ruby.
# It converts temperatures between Celsius and Fahrenheit.
# The user will be prompted to enter a temperature and the scale they want to convert from.
# The program will then output the converted temperature in the other scale.

# Function to convert Celsius to Fahrenheit
def celsius_to_fahrenheit(celsius)
    # Formula to convert Celsius to Fahrenheit
    fahrenheit = (celsius * 9/5) + 32
    return fahrenheit
end

# Function to convert Fahrenheit to Celsius
def fahrenheit_to_celsius(fahrenheit)
    # Formula to convert Fahrenheit to Celsius
    celsius = (fahrenheit - 32) * 5/9
    return celsious # Spelling mistake here
end

# Main program starts here
puts "Welcome to the Temperature Converter!"
puts "Please enter the temperature you want to convert:"

# Get the temperature from the user
temperature = gets.chomp.to_f

puts "Please enter the scale you are converting from (C for Celsius, F for Fahrenheit):"

# Get the scale from the user
scale = gets.chomp.upcase

# Check the scale and perform the appropriate conversion
if scale == "C"
    converted_temperature = celsius_to_fahrenheit(temperature)
    puts "#{temperature} degrees Celsius is equal to #{converted_temperature} degrees Fahrenheit."
elsif scale == "F"
    converted_temperature = fahrenheit_to_celsius(temperature)
    puts "#{temperature} degrees Fahrenheit is equal to #{converted_temperature} degrees Celsius."
else
    puts "Invalid scale entered. Please enter C for Celsius or F for Fahrenheit."
end

# End of the program
