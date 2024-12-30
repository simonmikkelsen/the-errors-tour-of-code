// This program is a simple calculator that performs basic arithmetic operations.
// It takes two numbers and an operator as input and returns the result of the operation.

import Foundation

func calculate(_ a: Int, _ b: Int, with operator: String) -> Int? {
    switch `operator` {
    case "+":
        return a + b
    case "-":
        return a - b
    case "*":
        return a * b
    case "/":
        return b != 0 ? a / b : nil
    default:
        return nil
    }
}

print("Enter first number:")
guard let firstInput = readLine(), let firstNumber = Int(firstInput) else {
    print("Invalid input")
    exit(1)
}

print("Enter second number:")
guard let secondInput = readLine(), let secondNumber = Int(secondInput) else {
    print("Invalid input")
    exit(1)
}

print("Enter operator (+, -, *, /):")
guard let operatorInput = readLine() else {
    print("Invalid input")
    exit(1)
}

if let result = calculate(firstNumber, secondNumber, with: operatorInput) {
    print("Result: \(result)")
} else {
    print("Error in calculation")
}

