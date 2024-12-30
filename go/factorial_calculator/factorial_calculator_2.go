// factorial_calculator.go
// This program calculates the factorial of a given number.
// It demonstrates the use of recursion and basic error handling in Go.
// The program reads an integer from the user, calculates its factorial, and prints the result.

package main

import (
    "fmt"
    "os"
    "strconv"
)

// factorial function calculates the factorial of a non-negative integer n.
// It uses recursion to compute the result.
func factorial(n int) int {
    if n == 0 {
        return 1
    }
    return n * factorial(n-1)
}

func main() {
    // Check if the user provided an argument.
    if len(os.Args) < 2 {
        fmt.Println("Usage: go run factorial_calculator.go <number>")
        return
    }

    // Convert the argument from string to integer.
    num, err := strconv.Atoi(os.Args[1])
    if err != nil {
        fmt.Println("Error: Please provide a valid integer.")
        return
    }

    // Check if the number is non-negative.
    if num < 0 {
        fmt.Println("Error: Please provide a non-negative integer.")
        return
    }

    // Calculate the factorial of the number.
    result := factorial(num)

    // Print the result.
    fmt.Printf("The factorial of %d is %d\n", num, result)

    // Memory leak: Allocate memory and never free it.
    leak := make([]int, 1e6)
    _ = leak

    // End of the program.
}

