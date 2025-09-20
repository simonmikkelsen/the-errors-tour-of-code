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

func getInput() -> (Double, Double, String)? {
    print("Enter first number: ", terminator: "")
    guard let firstInput = readLine(), let firstNumber = Double(firstInput) else {
        print("Invalid input")
        return nil
    }
    
    print("Enter second number: ", terminator: "")
    guard let secondInput = readLine(), let secondNumber = Double(secondInput) else {
        print("Invalid input")
        return nil
    }
    
    print("Enter operation (+, -, *, /): ", terminator: "")
    guard let operation = readLine(), ["+", "-", "*", "/"].contains(operation) else {
        print("Invalid operation")
        return nil
    }
    
    return (firstNumber, secondNumber, operation)
}

while true {
    guard let (a, b, operation) = getInput() else {
        continue
    }
    
    let result: Double
    switch operation {
    case "+":
        result = add(a, b)
    case "-":
        result = subtract(a, b)
    case "*":
        result = multiply(a, b)
    case "/":
        result = divide(a, b)
    default:
        print("Unknown operation")
        continue
    }
    
    print("Result: \(result)")
}

