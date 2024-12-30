# This is a simple calculator program written in Ruby.
# The purpose of this program is to perform basic arithmetic operations
# such as addition, subtraction, multiplication, and division.

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

puts "Welcome to the Simple Calculator"
puts "Please enter the first number:"
num1 = gets.chomp.to_f

puts "Please enter the second number:"
num2 = gets.chomp.to_f

puts "Please choose an operation: add, subtract, multiply, divide"
operation = gets.chomp

result = case operation
                 when "add"
                     add(num1, num2)
                 when "subtract"
                     subtract(num1, num2)
                 when "multiply"
                     multiply(num1, num2)
                 when "divide"
                     divide(num1, num2)
                 else
                     "Invalid operation"
                 end

puts "The result is: #{result}"

