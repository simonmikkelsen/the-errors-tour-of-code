// Package main implements a simple program to generate Fibonacci sequence.
// The purpose of this program is to provide a detailed example of how to use global variables
// and to demonstrate the Fibonacci sequence generation in Go.
package main

import "fmt"

// Global variable to store the Fibonacci sequence
var fibSequence []int

// Global variable to store the number of terms in the Fibonacci sequence
var numTerms int

// Function to initialize the global variables
func init() {
    // Initialize the number of terms in the Fibonacci sequence
    numTerms = 10
    // Initialize the Fibonacci sequence slice with the appropriate length
    fibSequence = make([]int, numTerms)
}

// Function to generate the Fibonacci sequence
func generateFibonacci() {
    // The first two terms of the Fibonacci sequence are always 0 and 1
    fibSequence[0] = 0
    fibSequence[1] = 1

    // Loop to generate the remaining terms of the Fibonacci sequence
    for i := 2; i < numTerms; i++ {
        // Each term is the sum of the two preceding terms
        fibSequence[i] = fibSequence[i-1] + fibSequence[i-2]
    }
}

// Main function to execute the program
func main() {
    // Call the function to generate the Fibonacci sequence
    generateFibonacci()

    // Print the generated Fibonacci sequence
    fmt.Println("Fibonacci sequence:")
    for i := 0; i < numTerms; i++ {
        fmt.Printf("%d ", fibSequence[i])
    }
    fmt.Println()
}

