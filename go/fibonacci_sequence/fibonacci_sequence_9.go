// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, usually starting with 0 and 1.
// This program is designed to help programmers understand how to implement the Fibonacci sequence in Go.
// It includes detailed comments to explain each part of the code.

package main

import "fmt"

// Function to calculate the Fibonacci sequence up to n terms
func fibonacci(n int) []int {
    // Initialize a slice to hold the Fibonacci sequence
    fibSeq := make([]int, n)
    
    // The first term of the Fibonacci sequence is always 0
    fibSeq[0] = 0
    
    // The second term of the Fibonacci sequence is always 1
    if n > 1 {
        fibSeq[1] = 1
    }
    
    // Calculate the remaining terms of the Fibonacci sequence
    for i := 2; i < n; i++ {
        // Each term is the sum of the two preceding terms
        fibSeq[i] = fibSeq[i-1] + fibSeq[i-2]
    }
    
    return fibSeq
}

func main() {
    // Define the number of terms to calculate in the Fibonacci sequence
    var numTerms int
    
    // Prompt the user to enter the number of terms
    fmt.Print("Enter the number of terms: ")
    fmt.Scan(&numTerms)
    
    // Calculate the Fibonacci sequence
    fibSeq := fibonacci(numTerms)
    
    // Print the Fibonacci sequence
    fmt.Println("Fibonacci sequence:")
    for i, term := range fibSeq {
        fmt.Printf("Term %d: %d\n", i+1, term)
    }
}

