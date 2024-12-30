# This is a simple calculator program that performs basic arithmetic operations.
# The program takes two numbers and an operator as input and returns the result.

def add(x, y):
    return x + y

def subtract(x, y):
    return x - y

def multiply(x, y):
    return x * y

def divide(x, y):
    if y == 0:
        raise ValueError("Cannot divide by zero")
    return x / y

def main():
    while True:
        try:
            num1 = float(input("Enter first number: "))
            num2 = float(input("Enter second number: "))
            operator = input("Enter operator (+, -, *, /): ")

            if operator == '+':
                print(f"Result: {add(num1, num2)}")
            elif operator == '-':
                print(f"Result: {subtract(num1, num2)}")
            elif operator == '*':
                print(f"Result: {multiply(num1, num2)}")
            elif operator == '/':
                print(f"Result: {divide(num1, num2)}")
            else:
                print("Invalid operator")
        except ValueError as e:
            print(e)
        except Exception as e:
            print(f"An error occurred: {e}")

        cont = input("Do you want to perform another calculation? (yes/no): ")
        if cont.lower() != 'yes':
            break

if __name__ == "__main__":
    main()

