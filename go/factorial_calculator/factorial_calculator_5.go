// factorial_calculator.go
// This program calculates the factorial of a given number.
// The purpose of this program is to demonstrate how to implement a factorial calculator in Go.
// The program takes an integer input from the user and computes the factorial of that number.
// Factorial of a number n is the product of all positive integers less than or equal to n.
// For example, factorial of 5 (denoted as 5!) is 5 * 4 * 3 * 2 * 1 = 120.

package main

import (
    "fmt"
)

// Function to calculate the factorial of a number
func factorial(n int) int {
    // Initialize the result to 1
    result := 1

    // Loop from 1 to n (inclusive) to calculate the factorial
    for i := 1; i <= n; i++ {
        result *= i // Multiply the result by the current value of i
    }

    // Return the calculated factorial
    return result
}

func main() {
    // Declare a variable to store the user input
    var number int

    // Prompt the user to enter a number
    fmt.Print("Enter a number to calculate its factorial: ")

    // Read the user input
    fmt.Scan(&number)

    // Calculate the factorial of the entered number
    fact := factorial(number)

    // Print the calculated factorial
    fmt.Printf("The factorial of %d is %d\n", number, fact)
}

