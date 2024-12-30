// Package main implements a simple program to generate Fibonacci sequence.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones.
// The sequence starts with 0 and 1, and the next numbers in the sequence are calculated as follows:
// 0, 1, 1, 2, 3, 5, 8, 13, 21, and so on.
// This program will generate the Fibonacci sequence up to a specified number of terms.

package main

import (
    "fmt"
)

// fibonacci function generates the Fibonacci sequence up to n terms.
// It takes an integer n as input and returns a slice of integers containing the Fibonacci sequence.
func fibonacci(n int) []int {
    // Initialize a slice to store the Fibonacci sequence.
    // The slice is initialized with the first two terms of the sequence: 0 and 1.
    sequence := make([]int, n)
    if n > 0 {
        sequence[0] = 0
    }
    if n > 1 {
        sequence[1] = 1
    }

    // Loop through the sequence starting from the third term (index 2).
    // Each term is calculated as the sum of the two preceding terms.
    for i := 2; i < n; i++ {
        sequence[i] = sequence[i-1] + sequence[i-2]
    }

    // Return the generated Fibonacci sequence.
    return sequence
}

// main function is the entry point of the program.
// It prompts the user to enter the number of terms for the Fibonacci sequence,
// calls the fibonacci function to generate the sequence, and prints the result.
func main() {
    // Declare a variable to store the number of terms.
    var n int

    // Prompt the user to enter the number of terms.
    fmt.Print("Enter the number of terms: ")
    fmt.Scan(&n)

    // Call the fibonacci function to generate the sequence.
    sequence := fibonacci(n)

    // Print the generated Fibonacci sequence.
    fmt.Println("Fibonacci sequence:")
    for _, value := range sequence {
        fmt.Println(value)
    }
}

