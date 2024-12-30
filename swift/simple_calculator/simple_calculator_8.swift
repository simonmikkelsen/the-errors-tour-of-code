//
// This program is a simple calculator written in Swift.
// It performs basic arithmetic operations such as addition, subtraction, multiplication, and division.
//

import Foundation

func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func subtract(_ a: Int, _ b: Int) -> Int {
    return a - b
}

func multiply(_ a: Int, _ b: Int) -> Int {
    return a * b
}

func divide(_ a: Int, _ b: Int) -> Int {
    return a / b
}

print("Enter first number:")
let firstNumber = Int(readLine()!)!

print("Enter second number:")
let secondNumber = Int(readLine()!)!

print("Choose operation (+, -, *, /):")
let operation = readLine()!

var result: Int

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
}

print("Result: \(result)")

