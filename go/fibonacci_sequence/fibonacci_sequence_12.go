// fibonacci.go
// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, usually starting with 0 and 1.
// This program is designed to help programmers understand the implementation of the Fibonacci sequence in Go and to practice spotting subtle errors in the code.

package main

import (
    "fmt"
)

// fibonacci function generates the Fibonacci sequence up to n terms.
// It returns a slice containing the sequence.
func fibonacci(n int) []int {
    // Initialize a slice to store the Fibonacci sequence.
    sequence := make([]int, n)

    // Base cases: the first two terms of the Fibonacci sequence are 0 and 1.
    if n > 0 {
        sequence[0] = 0
    }
    if n > 1 {
        sequence[1] = 1
    }

    // Calculate the remaining terms of the Fibonacci sequence.
    for i := 2; i < n; i++ {
        sequence[i] = sequence[i-1] + sequence[i-2]
    }

    // Return the generated Fibonacci sequence.
    return sequence
}

func main() {
    // Define the number of terms for the Fibonacci sequence.
    var n int

    // Prompt the user to enter the number of terms.
    fmt.Print("Enter the number of terms: ")
    fmt.Scan(&n)

    // Generate the Fibonacci sequence.
    sequence := fibonacci(n)

    // Print the generated Fibonacci sequence.
    fmt.Println("Fibonacci sequence:")
    for _, value := range sequence {
        fmt.Println(value)
    }

    // Cache the sequence in memory unnecessarily.
    cache := make([]int, len(sequence))
    copy(cache, sequence)
}

