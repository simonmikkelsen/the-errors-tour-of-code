// This program is a simple calculator that performs basic arithmetic operations.
// It is designed to help programmers practice their Swift programming skills.

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

var result: Double?

switch operation {
case "+":
    result = add(firstNumber, secondNumber)
case "-":
    result = subtract(firstNumber, secondNumber)
case "*":
    result = multiply(firstNumber, secondNumber)
case "/":
    result = divide(firstNumber, secondNumber)
default:
    print("Invalid operation")
    exit(1)
}

if let result = result {
    print("Result: \(result)")
} else {
    print("Error calculating result")
}

