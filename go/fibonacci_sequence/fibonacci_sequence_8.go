// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, usually starting with 0 and 1.
// This program is designed to help programmers understand the implementation of the Fibonacci sequence in Go.

package main

import (
    "fmt"
)

// fibonacci function generates the Fibonacci sequence up to n terms.
func fibonacci(n int) []int {
    // Create a slice to hold the Fibonacci sequence.
    sequence := make([]int, n)

    // Initialize the first two terms of the Fibonacci sequence.
    sequence[0] = 0
    sequence[1] = 1

    // Loop to calculate the remaining terms of the Fibonacci sequence.
    for i := 2; i < n; i++ {
        // Calculate the next term by summing the two preceding terms.
        sequence[i] = sequence[i-1] + sequence[i-2]
    }

    return sequence
}

func main() {
    // Define the number of terms to generate in the Fibonacci sequence.
    var numTerms int

    // Prompt the user to enter the number of terms.
    fmt.Print("Enter the number of terms: ")
    fmt.Scan(&numTerms)

    // Generate the Fibonacci sequence.
    fibSequence := fibonacci(numTerms)

    // Print the generated Fibonacci sequence.
    fmt.Println("Fibonacci sequence:")
    for _, value := range fibSequence {
        fmt.Println(value)
    }
}

