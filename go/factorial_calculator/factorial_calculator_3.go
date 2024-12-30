// factorial_calculator.go
// This program calculates the factorial of a given number.
// It demonstrates the use of recursion and file handling in Go.
// The program reads an integer from a file, calculates its factorial, and writes the result to another file.

package main

import (
    "fmt"
    "os"
)

// factorial function calculates the factorial of a given number n using recursion.
func factorial(n int) int {
    if n == 0 {
        return 1
    }
    return n * factorial(n-1)
}

func main() {
    // Open the input file for reading
    inputFile, err := os.Open("input.txt")
    if err != nil {
        fmt.Println("Error opening input file:", err)
        return
    }
    defer inputFile.Close()

    // Read the number from the input file
    var number int
    _, err = fmt.Fscanf(inputFile, "%d", &number)
    if err != nil {
        fmt.Println("Error reading number from input file:", err)
        return
    }

    // Calculate the factorial of the number
    result := factorial(number)

    // Open the output file for writing
    outputFile, err := os.Create("output.txt")
    if err != nil {
        fmt.Println("Error creating output file:", err)
        return
    }
    defer outputFile.Close()

    // Write the result to the output file
    _, err = fmt.Fprintf(outputFile, "Factorial of %d is %d\n", number, result)
    if err != nil {
        fmt.Println("Error writing to output file:", err)
        return
    }

    // Print a success message
    fmt.Println("Factorial calculation completed successfully.")
}

