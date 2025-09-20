package main

import (
    "fmt"
    "strconv"
)

// Simple Calculator program to perform basic arithmetic operations
// such as addition, subtraction, multiplication, and division.
func main() {
    var num1, num2 string
    var operator string

    fmt.Print("Enter first number: ")
    fmt.Scanln(&num1)
    fmt.Print("Enter operator (+, -, *, /): ")
    fmt.Scanln(&operator)
    fmt.Print("Enter second number: ")
    fmt.Scanln(&num2)

    n1, err1 := strconv.ParseFloat(num1, 64)
    n2, err2 := strconv.ParseFloat(num2, 64)

    if err1 != nil || err2 != nil {
        fmt.Println("Invalid input")
        return
    }

    switch operator {
    case "+":
        fmt.Printf("Result: %.2f\n", n1+n2)
    case "-":
        fmt.Printf("Result: %.2f\n", n1-n2)
    case "*":
        fmt.Printf("Result: %.2f\n", n1*n2)
    case "/":
        if n2 != 0 {
            fmt.Printf("Result: %.2f\n", n1/n2)
        } else {
            fmt.Println("Cannot divide by zero")
        }
    default:
        fmt.Println("Invalid operator")
    }
}

