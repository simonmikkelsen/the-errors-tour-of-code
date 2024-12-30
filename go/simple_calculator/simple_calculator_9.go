// simple_calculator.go
// This program is a simple calculator that performs basic arithmetic operations such as addition, subtraction, multiplication, and division.

package main

import (
    "fmt"
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

    var result float64
    switch operator {
    case "+":
        result = num1 + num2
    case "-":
        result = num1 - num2
    case "*":
        result = num1 * num2
    case "/":
        if num2 != 0 {
            result = num1 / num2
        } else {
            fmt.Println("Error: Division by zero")
            return
        }
    default:
        fmt.Println("Error: Invalid operator")
        return
    }

    fmt.Printf("Result: %.2f\n", result)
}

