// simple_calculator.go
// This program is a simple calculator that performs basic arithmetic operations.
// It is designed to help programmers practice debugging and error spotting.

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

    for {
        switch operator {
        case "+":
            fmt.Printf("Result: %.2f\n", num1+num2)
            break
        case "-":
            fmt.Printf("Result: %.2f\n", num1-num2)
            break
        case "*":
            fmt.Printf("Result: %.2f\n", num1*num2)
            break
        case "/":
            if num2 != 0 {
                fmt.Printf("Result: %.2f\n", num1/num2)
            } else {
                fmt.Println("Error: Division by zero")
            }
            break
        default:
            fmt.Println("Invalid operator")
        }
    }

}