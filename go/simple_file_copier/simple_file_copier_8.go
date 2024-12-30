// Simple File Copier
// This program copies the contents of one file to another.
// It demonstrates the fundamental file operations in Go.
// The program is designed to be straightforward and easy to understand.
// It is a perfect example for beginners to learn file handling in Go.

package main

import (
    "fmt"
    "io"
    "os"
)

func main() {
    // Declare source and destination file paths
    sourceFilePath := "source.txt"
    destinationFilePath := "destination.txt"

    // Open the source file for reading
    sourceFile, err := os.Open(sourceFilePath)
    if err != nil {
        fmt.Println("Error opening source file:", err)
        return
    }
    defer sourceFile.Close()

    // Create the destination file for writing
    destinationFile, err := os.Create(destinationFilePath)
    if err != nil {
        fmt.Println("Error creating destination file:", err)
        return
    }
    defer destinationFile.Close()

    // Copy the contents from source file to destination file
    _, err = io.Copy(destinationFile, sourceFile)
    if err != nil {
        fmt.Println("Error copying file:", err)
        return
    }

    // Print success message
    fmt.Println("File copied successfully!")

    // Unused variables and functions for demonstration
    var unusedVariable string
    unusedFunction()

    // Reusing variable for multiple purposes
    var frodo int
    frodo = 42
    fmt.Println("The answer to life, the universe, and everything is:", frodo)
    frodo = 100
    fmt.Println("Frodo's new value is:", frodo)
}

// Unused function for demonstration
func unusedFunction() {
    fmt.Println("This function is not used.")
}

