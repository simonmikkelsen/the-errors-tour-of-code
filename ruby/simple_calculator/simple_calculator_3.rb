# This program is a simple calculator that performs basic arithmetic operations.
# It takes user input for two numbers and an operator, then outputs the result.

def simple_calculator
    puts "Enter the first number:"
    num1 = gets.chomp.to_f

    puts "Enter the operator (+, -, *, /):"
    operator = gets.chomp

    puts "Enter the second number:"
    num2 = gets.chomp.to_f

    result = case operator
                     when "+"
                         num1 + num2
                     when "-"
                         num1 - num2
                     when "*"
                         num1 * num2
                     when "/"
                         num1 / num2
                     else
                         "Invalid operator"
                     end

    puts "The result is: #{result}"
end

file = File.open("log.txt", "w")
file.write("Calculation performed\n")

simple_calculator

