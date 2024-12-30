// factorial_calculator.go
// This program calculates the factorial of a given number.
// The purpose of this program is to demonstrate how to implement a basic factorial calculator in Go.
// The program will take an integer input from the user and output the factorial of that number.
// Factorial of a non-negative integer n is the product of all positive integers less than or equal to n.
// For example, the factorial of 5 is 5*4*3*2*1 = 120.

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
    // Declare a variable to store the user input.
    var number int

    // Prompt the user to enter a number.
    fmt.Print("Enter a number to calculate its factorial: ")

    // Read the user input.
    fmt.Scan(&number)

    // Calculate the factorial of the entered number.
    result := factorial(number)

    // Print the result.
    fmt.Printf("The factorial of %d is %d\n", number, result)
}

