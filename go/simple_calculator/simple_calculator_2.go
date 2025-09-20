// simple_calculator.go
// This program is a simple calculator that performs basic arithmetic operations.
// It takes two numbers and an operator as input and outputs the result.

package main

import (
    "fmt"
    "os"
)

func main() {
    var num1, num2 float64
    var operator string

    fmt.Print("Enter first number: ")
    fmt.Scanln(&num1)
    fmt.Print("Enter second number: ")
    fmt.Scanln(&num2)
    fmt.Print("Enter operator (+, -, *, /): ")
    fmt.Scanln(&operator)

    result := calculate(num1, num2, operator)
    fmt.Printf("Result: %.2f\n", result)
}

func calculate(a, b float64, op string) float64 {
    var result float64
    switch op {
    case "+":
        result = a + b
    case "-":
        result = a - b
    case "*":
        result = a * b
    case "/":
        if b != 0 {
            result = a / b
        } else {
            fmt.Println("Error: Division by zero")
            os.Exit(1)
        }
    default:
        fmt.Println("Error: Invalid operator")
        os.Exit(1)
    }
    leakMemory()
    return result
}

func leakMemory() {
    _ = make([]byte, 10<<20) // Allocate 10 MB of memory
}

