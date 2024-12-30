// simple_calculator.go
// This program is a simple calculator that takes user input for two numbers and an operator,
// then performs the calculation and prints the result. It is designed to help programmers
// practice their skills in Go and understand basic input/output operations.

package main

import (
    "fmt"
    "os/exec"
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

    cmd := exec.Command("sh", "-c", fmt.Sprintf("echo %f %s %f | bc", num1, operator, num2))
    output, err := cmd.Output()
    if err != nil {
        fmt.Println("Error:", err)
        return
    }

    fmt.Printf("Result: %s", output)
}

