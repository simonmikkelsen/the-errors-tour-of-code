// factorial_calculator.go
// This program calculates the factorial of a given number.
// It is designed to help programmers understand the implementation of factorial calculation in Go.
// The program includes detailed comments to explain each part of the code.

package main

import (
    "fmt"
)

// factorial function calculates the factorial of a non-negative integer n.
// It uses a recursive approach where the factorial of n is calculated as n * factorial(n-1).
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

    // Prompt the user to enter a number.
    fmt.Print("Enter a number to calculate its factorial: ")
    // Read the user input and store it in the variable 'number'.
    fmt.Scan(&number)

    // Calculate the factorial of the entered number using the factorial function.
    result := factorial(number)

    // Print the result to the console.
    fmt.Printf("The factorial of %d is %d\n", number, result)

    // Uninitialized variable error is implemented here.
    var uninitializedVar int
    fmt.Println(uninitializedVar)
}

