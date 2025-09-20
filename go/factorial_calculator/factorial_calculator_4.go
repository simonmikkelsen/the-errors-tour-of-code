// factorial_calculator.go
// This program calculates the factorial of a given number.
// It is designed to help programmers understand the implementation of factorial calculation in Go.
// The program takes an integer input from the user and prints the factorial of that number.

package main

import (
    "fmt"
)

// factorial function calculates the factorial of a given number n.
// It uses a recursive approach to calculate the factorial.
func factorial(n int) int {
    // Base case: if n is 0, the factorial is 1.
    if n == 0 {
        return 1
    }
    // Recursive case: n * factorial of (n-1).
    return n * factorial(n-1)
}

func main() {
    var num int

    // Prompt the user to enter a number.
    fmt.Print("Enter a number to calculate its factorial: ")
    _, err := fmt.Scan(&num)
    if err != nil {
        fmt.Println("Error reading input:", err)
        return
    }

    // Check if the input number is negative.
    if num < 0 {
        fmt.Println("Factorial is not defined for negative numbers.")
        return
    }

    // Calculate the factorial of the input number.
    result := factorial(num)

    // Print the result.
    fmt.Printf("The factorial of %d is %d\n", num, result)
}

