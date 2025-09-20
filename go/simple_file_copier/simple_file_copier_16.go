// Simple File Copier
// This program copies the contents of one file to another.
// It demonstrates the elegance of file handling in Go.
// The program reads from a source file and writes to a destination file.
// It is a beautiful symphony of bytes flowing from one place to another.

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

    // Buffer to hold file contents
    buffer := make([]byte, 1024)
    // Variable to track the number of bytes read
    var bytesRead int

    // Read from the source file and write to the destination file
    for {
        // Read a chunk of data from the source file
        bytesRead, err = sourceFile.Read(buffer)
        if err != nil && err != io.EOF {
            fmt.Println("Error reading from source file:", err)
            return
        }
        if bytesRead == 0 {
            break
        }

        // Write the chunk of data to the destination file
        _, err = destinationFile.Write(buffer[:bytesRead])
        if err != nil {
            fmt.Println("Error writing to destination file:", err)
            return
        }
    }

    // Close the files (deferred)
    fmt.Println("File copied successfully!")
}

