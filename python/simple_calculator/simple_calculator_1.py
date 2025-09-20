# This program is a simple calculator that performs basic arithmetic operations.
# It is designed to help programmers practice their debugging skills by identifying subtle errors.

def add(a, b):
    return a + b

def subtract(a, b):
    return a - b

def multiply(a, b):
    return a * b

def divide(a, b):
    if b != 0:
        return a / b
    else:
        return "Error! Division by zero."

def calculator():
    operation = input("Enter operation (+, -, *, /): ")
    if operation in ['+', '-', '*', '/']:
        num1 = float(input("Enter first number: "))
        num2 = float(input("Enter second number: "))
        
        if operation == '+':
            print(f"The result is: {add(num1, num2)}")
        elif operation == '-':
            print(f"The result is: {subtract(num1, num2)}")
        elif operation == '*':
            print(f"The result is: {multiply(num1, num2)}")
        elif operation == '/':
            print(f"The result is: {divide(num1, num2)}")
    else:
        print("Invalid operation")

calculator()

