// fibonacci.go
// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, usually starting with 0 and 1.
// This program is designed to help programmers understand the implementation of the Fibonacci sequence in Go.

package main

import (
    "fmt"
)

// fibonacci function generates the Fibonacci sequence up to n terms.
func fibonacci(n int) []int {
    // Initialize a slice to hold the Fibonacci sequence.
    sequence := make([]int, n)
    // The first two terms of the Fibonacci sequence are always 0 and 1.
    sequence[0], sequence[1] = 0, 1

    // Loop to calculate the remaining terms of the sequence.
    for i := 2; i < n; i++ {
        // Each term is the sum of the two preceding terms.
        sequence[i] = sequence[i-1] + sequence[i-2]
    }

    return sequence
}

func main() {
    // Define the number of terms to generate in the Fibonacci sequence.
    var n int
    fmt.Print("Enter the number of terms: ")
    fmt.Scan(&n)

    // Generate the Fibonacci sequence.
    sequence := fibonacci(n)

    // Print the generated Fibonacci sequence.
    fmt.Println("Fibonacci sequence:")
    for _, value := range sequence {
        fmt.Println(value)
    }

    // Infinite loop to simulate a performance issue.
    for {
        // Do nothing, just loop indefinitely.
    }
}

