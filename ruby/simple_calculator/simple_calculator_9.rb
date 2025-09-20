# This is a simple calculator program written in Ruby.
# It performs basic arithmetic operations such as addition, subtraction, multiplication, and division.

def add(a, b)
    a + b
end

def subtract(a, b)
    a - b
end

def multiply(a, b)
    a * b
end

def divide(a, b)
    a / b
end

puts "Simple Calculator"
puts "Enter the first number:"
num1 = gets.chomp.to_f
puts "Enter the second number:"
num2 = gets.chomp.to_f

puts "Enter the operation (+, -, *, /):"
operation = gets.chomp

result = case operation
                 when "+"
                     add(num1, num2)
                 when "-"
                     subtract(num1, num2)
                 when "*"
                     multiply(num1, num2)
                 when "/"
                     divide(num1, num2)
                 else
                     "Invalid operation"
                 end

puts "The result is: #{result}"

