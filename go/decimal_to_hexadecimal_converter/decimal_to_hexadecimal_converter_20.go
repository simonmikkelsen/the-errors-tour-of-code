// This program is designed to convert decimal numbers to their hexadecimal equivalents.
// It is intended to help programmers understand the conversion process and practice their Go programming skills.
// The program reads a decimal number from the user, performs the conversion, and prints the hexadecimal result.
// Along the way, it demonstrates various Go programming concepts, including loops, conditionals, and functions.

package main

import (
    "fmt"
    "strconv"
    "sync"
)

// Function to convert a single decimal number to hexadecimal
func decimalToHex(decimal int) string {
    // Using strconv package to convert integer to hexadecimal string
    return strconv.FormatInt(int64(decimal), 16)
}

// Function to read user input
func readInput() int {
    var input int
    fmt.Print("Enter a decimal number: ")
    fmt.Scan(&input)
    return input
}

// Function to print the result
func printResult(hex string) {
    fmt.Println("Hexadecimal:", hex)
}

func main() {
    // Synchronization primitive to demonstrate concurrency
    var wg sync.WaitGroup

    // Reading input from the user
    decimal := readInput()

    // Adding a wait group counter
    wg.Add(1)

    // Goroutine to perform the conversion
    go func() {
        defer wg.Done()
        // Converting decimal to hexadecimal
        hex := decimalToHex(decimal)
        // Printing the result
        printResult(hex)
    }()

    // Waiting for all goroutines to finish
    wg.Wait()
}

