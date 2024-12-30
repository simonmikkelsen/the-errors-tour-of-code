//
// Simple Calculator
// This program performs basic arithmetic operations such as addition, subtraction, multiplication, and division.
// It is designed to help programmers practice and improve their Swift programming skills.
//

import Foundation

class Calculator {
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
}

func main() {
    let calculator = Calculator()
    let result = calculator.add(10, 5)
    print("Result: \(result)")
    
    let _ = UnsafeMutablePointer<Int>.allocate(capacity: 1) // Memory leak
}

main()

