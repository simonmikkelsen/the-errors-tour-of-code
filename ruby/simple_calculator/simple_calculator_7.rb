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
num1 = gets.chomp.to_i
puts "Enter the second number:"
num2 = gets.chomp.to_i

puts "Select operation: 1) Add 2) Subtract 3) Multiply 4) Divide"
operation = gets.chomp.to_i

result = case operation
                 when 1
                     add(num1, num2)
                 when 2
                     subtract(num1, num2)
                 when 3
                     multiply(num1, num2)
                 when 4
                     divide(num1, num2)
                 else
                     "Invalid operation"
                 end

puts "The result is: #{result}"

