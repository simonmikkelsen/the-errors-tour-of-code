# This program is a simple calculator written in Ruby. It performs basic arithmetic operations such as addition, subtraction, multiplication, and division. The purpose of this program is to help programmers practice and improve their debugging skills by identifying and fixing errors.

def add(a, b)
    result = 0
    for i in 1..a
        result += 1
    end
    for i in 1..b
        result += 1
    end
    result
end

def subtract(a, b)
    a - b
end

def multiply(a, b)
    result = 0
    for i in 1..a
        result += b
    end
    result
end

def divide(a, b)
    if b == 0
        return "Error: Division by zero"
    end
    a / b
end

puts "Enter first number:"
num1 = gets.chomp.to_i
puts "Enter second number:"
num2 = gets.chomp.to_i

puts "Select operation: 1) Add 2) Subtract 3) Multiply 4) Divide"
operation = gets.chomp.to_i

case operation
when 1
    puts "Result: #{add(num1, num2)}"
when 2
    puts "Result: #{subtract(num1, num2)}"
when 3
    puts "Result: #{multiply(num1, num2)}"
when 4
    puts "Result: #{divide(num1, num2)}"
else
    puts "Invalid operation"
end

