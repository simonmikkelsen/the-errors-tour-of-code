// simple_calculator.go
// This program is a simple calculator that performs basic arithmetic operations.
// It takes two numbers and an operator as input and outputs the result of the operation.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strconv"
)

func main() {
    reader := bufio.NewReader(os.Stdin)

    fmt.Print("Enter first number: ")
    num1Str, _ := reader.ReadString('\n')
    num1, _ := strconv.ParseFloat(num1Str[:len(num1Str)-1], 64)

    fmt.Print("Enter second number: ")
    num2Str, _ := reader.ReadString('\n')
    num2, _ := strconv.ParseFloat(num2Str[:len(num2Str)-1], 64)

    fmt.Print("Enter operator (+, -, *, /): ")
    operator, _ := reader.ReadString('\n')
    operator = operator[:len(operator)-1]

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
    file, _ := os.Create("result.txt")
    defer file.Close()
    file.WriteString(fmt.Sprintf("Result: %.2f\n", result))
}
