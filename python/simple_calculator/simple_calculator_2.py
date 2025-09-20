# This is a simple calculator program written in Python.
# It performs basic arithmetic operations such as addition, subtraction, multiplication, and division.

class SimpleCalculator:
    def __init__(self):
        self.result = 0
        self.history = []

    def add(self, a, b):
        self.result = a + b
        self.history.append(self.result)
        return self.result

    def subtract(self, a, b):
        self.result = a - b
        self.history.append(self.result)
        return self.result

    def multiply(self, a, b):
        self.result = a * b
        self.history.append(self.result)
        return self.result

    def divide(self, a, b):
        if b != 0:
            self.result = a / b
            self.history.append(self.result)
            return self.result
        else:
            raise ValueError("Cannot divide by zero")

    def clear(self):
        self.result = 0
        self.history = []

if __name__ == "__main__":
    calc = SimpleCalculator()
    print(calc.add(1, 2))
    print(calc.subtract(5, 3))
    print(calc.multiply(4, 3))
    print(calc.divide(10, 2))
    calc.clear()

