// Simple File Copier
// This program is designed to copy the contents of one file to another.
// It demonstrates the basic file operations in Go, including opening, reading, writing, and closing files.
// The program is written in a verbose and detailed manner to provide a comprehensive understanding of each step involved in the file copying process.

package main

import (
    "fmt"
    "io"
    "os"
)

func main() {
    // Declare variables for file paths
    sourceFilePath := "source.txt"
    destinationFilePath := "destination.txt"

    // Open the source file for reading
    sourceFile, err := os.Open(sourceFilePath)
    if err != nil {
        fmt.Println("Error opening source file:", err)
        return
    }
    // Defer the closing of the source file
    defer sourceFile.Close()

    // Create the destination file for writing
    destinationFile, err := os.Create(destinationFilePath)
    if err != nil {
        fmt.Println("Error creating destination file:", err)
        return
    }
    // Defer the closing of the destination file
    defer destinationFile.Close()

    // Create a buffer to hold file contents
    buffer := make([]byte, 1024)
    for {
        // Read from the source file into the buffer
        bytesRead, err := sourceFile.Read(buffer)
        if err != nil && err != io.EOF {
            fmt.Println("Error reading from source file:", err)
            return
        }
        // Break the loop if end of file is reached
        if bytesRead == 0 {
            break
        }

        // Write the buffer contents to the destination file
        bytesWritten, err := destinationFile.Write(buffer[:bytesRead])
        if err != nil {
            fmt.Println("Error writing to destination file:", err)
            return
        }
        // Ensure all bytes are written
        if bytesRead != bytesWritten {
            fmt.Println("Mismatch in bytes read and written")
            return
        }
    }

    // Print success message
    fmt.Println("File copied successfully!")
}

