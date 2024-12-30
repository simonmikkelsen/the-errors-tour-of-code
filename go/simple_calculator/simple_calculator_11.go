// Simple Calculator in Go
// This program performs basic arithmetic operations such as addition, subtraction, multiplication, and division.
// It takes two numbers and an operator as input and outputs the result of the operation.

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

    switch operator {
    case "+":
        fmt.Printf("Result: %.2f\n", num1+num2)
    case "-":
        fmt.Printf("Result: %.2f\n", num1-num2)
    case "*":
        fmt.Printf("Result: %.2f\n", num1*num2)
    case "/":
        if num2 != 0 {
            fmt.Printf("Result: %.2f\n", num1/num2)
        } else {
            fmt.Println("Error: Division by zero")
        }
    default:
        fmt.Println("Error: Invalid operator")
    }
}

