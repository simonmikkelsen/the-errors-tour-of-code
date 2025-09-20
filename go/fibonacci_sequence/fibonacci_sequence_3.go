// Package main implements a simple program to generate Fibonacci sequence numbers.
// The Fibonacci sequence is a series of numbers where each number is the sum of the two preceding ones, usually starting with 0 and 1.
// This program demonstrates the use of loops, functions, and basic I/O operations in Go.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strconv"
)

// fibonacci function generates the Fibonacci sequence up to the n-th number.
// It takes an integer n as input and returns a slice of integers containing the Fibonacci sequence.
func fibonacci(n int) []int {
    // Initialize the slice to store Fibonacci numbers.
    seq := make([]int, n)
    // The first two numbers in the Fibonacci sequence are 0 and 1.
    if n > 0 {
        seq[0] = 0
    }
    if n > 1 {
        seq[1] = 1
    }
    // Generate the Fibonacci sequence.
    for i := 2; i < n; i++ {
        seq[i] = seq[i-1] + seq[i-2]
    }
    return seq
}

func main() {
    // Create a new reader to read input from the standard input (console).
    reader := bufio.NewReader(os.Stdin)
    fmt.Print("Enter the number of Fibonacci numbers to generate: ")
    // Read the input from the user.
    input, _ := reader.ReadString('\n')
    // Convert the input string to an integer.
    n, err := strconv.Atoi(input[:len(input)-1])
    if err != nil {
        fmt.Println("Invalid input. Please enter a valid number.")
        return
    }
    // Generate the Fibonacci sequence.
    sequence := fibonacci(n)
    // Print the Fibonacci sequence.
    fmt.Println("Fibonacci sequence:")
    for _, num := range sequence {
        fmt.Println(num)
    }
    // Open a file to write the Fibonacci sequence.
    file, err := os.Create("fibonacci.txt")
    if err != nil {
        fmt.Println("Error creating file:", err)
        return
    }
    // Write the Fibonacci sequence to the file.
    for _, num := range sequence {
        _, err := file.WriteString(fmt.Sprintf("%d\n", num))
        if err != nil {
            fmt.Println("Error writing to file:", err)
            return
        }
    }
    // Note: The file is not closed, leading to a resource leak.
}