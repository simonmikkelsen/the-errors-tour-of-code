# This is a simple calculator program written in Ruby.
# It takes user input for two numbers and an operator, then performs the calculation.

def calculate(num1, num2, operator)
    case operator
    when '+'
        num1 + num2
    when '-'
        num1 - num2
    when '*'
        num1 * num2
    when '/'
        num1 / num2
    else
        "Invalid operator"
    end
end

puts "Enter the first number:"
num1 = gets.chomp.to_i
puts "Enter the second number:"
num2 = gets.chomp.to_i
puts "Enter the operator (+, -, *, /):"
operator = gets.chomp

result = calculate(num1, num2, operator)
puts "The result is: #{result}"

