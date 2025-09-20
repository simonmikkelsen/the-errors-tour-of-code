// factorial_calculator.go
// This program calculates the factorial of a given number.
// It uses a global variable to store the result of the factorial calculation.
// The purpose of this program is to demonstrate how to calculate factorials in Go.

package main

import "fmt"

// Global variable to store the result of the factorial calculation
var result int

// Function to calculate the factorial of a number
func factorial(n int) int {
    // Base case: if n is 0, return 1
    if n == 0 {
        return 1
    }
    // Recursive case: n * factorial(n-1)
    result = n * factorial(n-1)
    return result
}

func main() {
    // Variable to store the number for which we want to calculate the factorial
    var number int

    // Prompt the user to enter a number
    fmt.Print("Enter a number: ")
    fmt.Scan(&number)

    // Calculate the factorial of the entered number
    factorial(number)

    // Print the result
    fmt.Printf("The factorial of %d is %d\n", number, result)
}

