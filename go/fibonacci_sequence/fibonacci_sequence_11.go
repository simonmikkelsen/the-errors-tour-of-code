// fibonacci.go
// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, usually starting with 0 and 1.
// This program is designed to help programmers understand the implementation of the Fibonacci sequence using Go and regular expressions.

package main

import (
    "fmt"
    "regexp"
    "strconv"
)

// Function to generate the Fibonacci sequence up to n terms
func generateFibonacci(n int) []int {
    // Initialize the first two terms of the Fibonacci sequence
    fib := []int{0, 1}

    // Generate the Fibonacci sequence up to n terms
    for i := 2; i < n; i++ {
        nextTerm := fib[i-1] + fib[i-2]
        fib = append(fib, nextTerm)
    }

    return fib
}

// Function to validate if the input is a valid positive integer using regular expressions
func isValidInput(input string) bool {
    // Regular expression to match a positive integer
    re := regexp.MustCompile(`^[1-9]\d*$`)
    return re.MatchString(input)
}

func main() {
    // Prompt the user to enter the number of terms for the Fibonacci sequence
    fmt.Print("Enter the number of terms for the Fibonacci sequence: ")
    var input string
    fmt.Scanln(&input)

    // Validate the input
    if !isValidInput(input) {
        fmt.Println("Invalid input. Please enter a positive integer.")
        return
    }

    // Convert the input to an integer
    n, err := strconv.Atoi(input)
    if err != nil {
        fmt.Println("Error converting input to integer:", err)
        return
    }

    // Generate the Fibonacci sequence
    fibSequence := generateFibonacci(n)

    // Print the Fibonacci sequence
    fmt.Println("Fibonacci sequence:")
    for _, term := range fibSequence {
        fmt.Println(term)
    }
}

