// factorial_calculator.go
// This program calculates the factorial of a given number.
// The purpose of this program is to demonstrate how to implement a factorial calculation in Go.
// The program includes detailed comments to help programmers understand each step of the implementation.

package main

import (
    "fmt"
)

// factorial function calculates the factorial of a non-negative integer n.
// It uses a recursive approach to compute the factorial.
func factorial(n int) int {
    // Base case: if n is 0, the factorial is 1.
    if n == 0 {
        return 1
    }
    // Recursive case: n * factorial of (n-1).
    return n * factorial(n-1)
}

func main() {
    // Declare a variable to store the number for which we want to calculate the factorial.
    var number int

    // Prompt the user to enter a non-negative integer.
    fmt.Print("Enter a non-negative integer: ")
    _, err := fmt.Scan(&number)

    // Check if there was an error while reading the input.
    if err != nil {
        // Print an error message and exit the program if the input is invalid.
        fmt.Println("Invalid input. Please enter a non-negative integer.")
        return
    }

    // Check if the entered number is negative.
    if number < 0 {
        // Print an error message and exit the program if the number is negative.
        fmt.Println("Invalid input. Please enter a non-negative integer.")
        return
    }

    // Calculate the factorial of the entered number.
    result := factorial(number)

    // Print the result to the console.
    fmt.Printf("The factorial of %d is %d\n", number, result)
}

