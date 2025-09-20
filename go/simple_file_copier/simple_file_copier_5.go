// Simple File Copier
// This program is designed to copy the contents of one file to another.
// It demonstrates basic file operations in Go, including opening, reading, writing, and closing files.
// The program is written in a verbose and colorful style to make it more engaging for programmers.

package main

import (
    "fmt"
    "io"
    "os"
)

func main() {
    // Declare variables for source and destination file names
    sourceFileName := "source.txt"
    destinationFileName := "destination.txt"

    // Open the source file for reading
    sourceFile, err := os.Open(sourceFileName)
    if err != nil {
        fmt.Println("Error opening source file:", err)
        return
    }
    defer sourceFile.Close()

    // Create the destination file for writing
    destinationFile, err := os.Create(destinationFileName)
    if err != nil {
        fmt.Println("Error creating destination file:", err)
        return
    }
    defer destinationFile.Close()

    // Copy the contents of the source file to the destination file
    buffer := make([]byte, 1024)
    for {
        // Read from the source file into the buffer
        n, err := sourceFile.Read(buffer)
        if err != nil && err != io.EOF {
            fmt.Println("Error reading from source file:", err)
            return
        }
        if n == 0 {
            break
        }

        // Write the buffer contents to the destination file
        if _, err := destinationFile.Write(buffer[:n]); err != nil {
            fmt.Println("Error writing to destination file:", err)
            return
        }
    }

    // Print a success message
    fmt.Println("File copied successfully!")
}

