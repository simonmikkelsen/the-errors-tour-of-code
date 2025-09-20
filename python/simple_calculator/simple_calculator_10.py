# This is a simple calculator program written in Python.
# It takes user input to perform basic arithmetic operations like addition, subtraction, multiplication, and division.

def add(x, y):
    return x + y

def subtract(x, y):
    return x - y

def multiply(x, y):
    return x * y

def divide(x, y):
    if y == 0:
        return "Error! Division by zero."
    else:
        return x / y

def calculator():
    operation = input("Enter operation (+, -, *, /): ")
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

if __name__ == "__main__":
    calculator()

