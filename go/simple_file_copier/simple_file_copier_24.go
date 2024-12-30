// Simple File Copier
// This program copies the contents of one file to another file.
// It demonstrates basic file operations in Go, including opening, reading, writing, and closing files.
// The program is designed to be straightforward and easy to understand for beginner programmers.

package main

import (
    "fmt"
    "io"
    "os"
)

func main() {
    // Define the source and destination file paths
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

    // Copy the contents of the source file to the destination file
    _, err = io.Copy(destinationFile, sourceFile)
    if err != nil {
        fmt.Println("Error copying file contents:", err)
        return
    }

    // Close the source file (this is redundant due to the defer statement above)
    sourceFile.Close()

    // Print a success message
    fmt.Println("File copied successfully!")
}

