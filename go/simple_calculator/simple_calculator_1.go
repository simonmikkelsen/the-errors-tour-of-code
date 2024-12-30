package main

import (
    "fmt"
    "strconv"
    "strings"
)

// Simple Calculator: This program performs basic arithmetic operations such as addition, subtraction, multiplication, and division.
// It takes user input in the form of a string and parses it to perform the desired operation.

func main() {
    var input string
    fmt.Println("Enter calculation (e.g., 2 + 2):")
    fmt.Scanln(&input)

    parts := strings.Fields(input)
    if len(parts) != 3 {
        fmt.Println("Invalid input")
        return
    }

    num1, err1 := strconv.ParseFloat(parts[0], 64)
    num2, err2 := strconv.ParseFloat(parts[2], 64)
    if err1 != nil || err2 != nil {
        fmt.Println("Invalid numbers")
        return
    }

    operator := parts[1]
    var result float64

    switch operator {
    case "+":
        result = num1 + num2
    case "-":
        result = num1 - num2
    case "*":
        result = num1 * num2
    case "/":
        if num2 == 0 {
            fmt.Println("Cannot divide by zero")
            return
        }
        result = num1 / num2
    default:
        fmt.Println("Invalid operator")
        return
    }

    fmt.Printf("Result: %.2f\n", result)
}

