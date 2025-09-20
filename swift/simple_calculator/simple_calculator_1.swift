// This program is a simple calculator that performs basic arithmetic operations such as addition, subtraction, multiplication, and division.

import Foundation

func add(_ a: Double, _ b: Double) -> Double {
    return a + b
}

func subtract(_ a: Double, _ b: Double) -> Double {
    return a - b
}

func multiply(_ a: Double, _ b: Double) -> Double {
    return a * b
}

func divide(_ a: Double, _ b: Double) -> Double {
    return a / b
}

func calculate(_ a: Double, _ b: Double, _ operation: String) -> Double? {
    switch operation {
    case "+":
        return add(a, b)
    case "-":
        return subtract(a, b)
    case "*":
        return multiply(a, b)
    case "/":
        return divide(a, b)
    default:
        return nil
    }
}

print("Enter first number:")
guard let firstInput = readLine(), let firstNumber = Double(firstInput) else {
    print("Invalid input")
    exit(1)
}

print("Enter second number:")
guard let secondInput = readLine(), let secondNumber = Double(secondInput) else {
    print("Invalid input")
    exit(1)
}

print("Enter operation (+, -, *, /):")
guard let operation = readLine() else {
    print("Invalid input")
    exit(1)
}

if let result = calculate(firstNumber, secondNumber, operation) {
    print("Result: \(result)")
} else {
    print("Invalid operation")
}

