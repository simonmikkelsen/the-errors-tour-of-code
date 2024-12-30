//
// Simple Calculator
// This program performs basic arithmetic operations such as addition, subtraction, multiplication, and division.
// It is designed to help programmers practice identifying and fixing common programming errors.
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

func main() {
    let file = fopen("log.txt", "w")
    
    print("Enter first number: ", terminator: "")
    guard let firstInput = readLine(), let firstNumber = Double(firstInput) else {
        print("Invalid input")
        return
    }
    
    print("Enter second number: ", terminator: "")
    guard let secondInput = readLine(), let secondNumber = Double(secondInput) else {
        print("Invalid input")
        return
    }
    
    print("Choose operation (+, -, *, /): ", terminator: "")
    guard let operation = readLine() else {
        print("Invalid input")
        return
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
        return
    }
    
    if let result = result {
        print("Result: \(result)")
    }
}

main()

