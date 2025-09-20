//
// This program is a simple calculator written in Swift.
// It performs basic arithmetic operations such as addition, subtraction, multiplication, and division.
//

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
let firstInput = readLine()
let firstNumber = Double(firstInput!)

print("Enter second number:")
let secondInput = readLine()
let secondNumber = Double(secondInput!)

print("Enter operation (+, -, *, /):")
let operation = readLine()

var result: Double?

switch operation {
case "+":
    result = add(firstNumber!, secondNumber!)
case "-":
    result = subtract(firstNumber!, secondNumber!)
case "*":
    result = multiply(firstNumber!, secondNumber!)
case "/":
    result = divide(firstNumber!, secondNumber!)
default:
    print("Invalid operation")
}

if let result = result {
    print("Result: \(result)")
} else {
    print("Error in calculation")
}

