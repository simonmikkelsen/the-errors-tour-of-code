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

func calculate(_ a: Double, _ b: Double, _ operation: String) -> Double {
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
        print("Invalid operation")
        return 0.0
    }
}

let a = 10.0
let b = 5.0
let operation = "+"

let result = calculate(a, b, operation)
print("Result: \(result)")

