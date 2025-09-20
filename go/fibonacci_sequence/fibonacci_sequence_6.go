// Fibonacci Sequence Program in Go
// This program calculates the Fibonacci sequence up to a specified number of terms.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, usually starting with 0 and 1.
// This program is designed to help programmers understand the implementation of the Fibonacci sequence in Go.

package main

import (
    "fmt"
    "strconv"
)

// Function to generate Fibonacci sequence
func fibonacci(n int) []int {
    // Initialize the slice to store Fibonacci numbers
    fibSeq := make([]int, n)
    // The first Fibonacci number is 0
    fibSeq[0] = 0
    // The second Fibonacci number is 1
    if n > 1 {
        fibSeq[1] = 1
    }
    // Generate the Fibonacci sequence
    for i := 2; i < n; i++ {
        fibSeq[i] = fibSeq[i-1] + fibSeq[i-2]
    }
    return fibSeq
}

func main() {
    // Prompt the user to enter the number of terms
    fmt.Print("Enter the number of terms: ")
    var input string
    fmt.Scanln(&input)

    // Convert the input to an integer
    numTerms, err := strconv.Atoi(input)
    if err != nil {
        fmt.Println("Invalid input. Please enter a valid number.")
        return
    }

    // Generate the Fibonacci sequence
    fibSeq := fibonacci(numTerms)

    // Print the Fibonacci sequence
    fmt.Println("Fibonacci sequence:")
    for _, num := range fibSeq {
        fmt.Println(num)
    }
}

