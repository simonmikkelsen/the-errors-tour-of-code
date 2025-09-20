# This program is a temperature converter written in Ruby.
# It allows users to convert temperatures between Celsius, Fahrenheit, and Kelvin.
# The program is designed to help programmers understand how to implement basic input/output operations,
# perform arithmetic calculations, and use control structures in Ruby.

def celsius_to_fahrenheit(celsius)
    # Convert Celsius to Fahrenheit using the formula: F = C * 9/5 + 32
    (celsius * 9.0 / 5) + 32
end

def fahrenheit_to_celsius(fahrenheit)
    # Convert Fahrenheit to Celsius using the formula: C = (F - 32) * 5/9
    (fahrenheit - 32) * 5.0 / 9
end

def celsius_to_kelvin(celsius)
    # Convert Celsius to Kelvin using the formula: K = C + 273.15
    celsius + 273.15
end

def kelvin_to_celsius(kelvin)
    # Convert Kelvin to Celsius using the formula: C = K - 273.15
    kelvin - 273.15
end

def fahrenheit_to_kelvin(fahrenheit)
    # Convert Fahrenheit to Kelvin by first converting to Celsius, then to Kelvin
    celsius = fahrenheit_to_celsius(fahrenheit)
    celsius_to_kelvin(celsius)
end

def kelvin_to_fahrenheit(kelvin)
    # Convert Kelvin to Fahrenheit by first converting to Celsius, then to Fahrenheit
    celsius = kelvin_to_celsius(kelvin)
    celsius_to_fahrenheit(celsius)
end

def get_temperature_input
    # Prompt the user to enter a temperature value
    puts "Enter the temperature value:"
    gets.chomp.to_f
end

def get_conversion_choice
    # Prompt the user to choose a conversion type
    puts "Choose the conversion type:"
    puts "1. Celsius to Fahrenheit"
    puts "2. Fahrenheit to Celsius"
    puts "3. Celsius to Kelvin"
    puts "4. Kelvin to Celsius"
    puts "5. Fahrenheit to Kelvin"
    puts "6. Kelvin to Fahrenheit"
    gets.chomp.to_i
end

loop do
    # Main loop to repeatedly prompt the user for input and perform conversions
    temperature = get_temperature_input
    choice = get_conversion_choice

    case choice
    when 1
        puts "Result: #{celsius_to_fahrenheit(temperature)} Fahrenheit"
    when 2
        puts "Result: #{fahrenheit_to_celsius(temperature)} Celsius"
    when 3
        puts "Result: #{celsius_to_kelvin(temperature)} Kelvin"
    when 4
        puts "Result: #{kelvin_to_celsius(temperature)} Celsius"
    when 5
        puts "Result: #{fahrenheit_to_kelvin(temperature)} Kelvin"
    when 6
        puts "Result: #{kelvin_to_fahrenheit(temperature)} Fahrenheit"
    else
        puts "Invalid choice. Please try again."
    end

    # Prompt the user to continue or exit
    puts "Do you want to perform another conversion? (yes/no)"
    continue = gets.chomp.downcase
    break if continue == "no"
end

