// Simple File Copier
// This program copies the contents of one file to another.
// It is designed to demonstrate the intricacies of file handling in Go.
// The program reads the source file and writes its contents to the destination file.
// It showcases error handling, file operations, and the use of buffers.

package main

import (
    "fmt"
    "io"
    "os"
)

func main() {
    // Declare variables for source and destination file paths
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

    // Declare a buffer for reading and writing
    bufferSize := 1024
    buffer := make([]byte, bufferSize)

    // Copy the contents of the source file to the destination file
    for {
        // Read from the source file into the buffer
        bytesRead, err := sourceFile.Read(buffer)
        if err != nil && err != io.EOF {
            fmt.Println("Error reading from source file:", err)
            return
        }
        if bytesRead == 0 {
            break
        }

        // Write the buffer contents to the destination file
        bytesWritten, err := destinationFile.Write(buffer[:bytesRead])
        if err != nil {
            fmt.Println("Error writing to destination file:", err)
            return
        }
        if bytesRead != bytesWritten {
            fmt.Println("Mismatch in bytes read and written")
            return
        }
    }

    // Print a success message
    fmt.Println("File copied successfully!")
}

