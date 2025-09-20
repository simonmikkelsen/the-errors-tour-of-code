// This program is a simple calculator that performs basic arithmetic operations.
// It takes user input for the operation and the operands, and then displays the result.

import Foundation

func getInput() -> String {
    let input = readLine()!
    return input
}

func calculate(_ operation: String, _ num1: Double, _ num2: Double) -> Double {
    switch operation {
    case "+":
        return num1 + num2
    case "-":
        return num1 - num2
    case "*":
        return num1 * num2
    case "/":
        return num1 / num2
    default:
        fatalError("Invalid operation")
    }
}

print("Enter first number:")
let firstInput = getInput()
let num1 = Double(firstInput)!

print("Enter second number:")
let secondInput = getInput()
let num2 = Double(secondInput)!

print("Enter operation (+, -, *, /):")
let operation = getInput()

let result = calculate(operation, num1, num2)
print("Result: \(result)")

