// This program is a simple file copier written in Go.
// It demonstrates the process of reading from a source file and writing to a destination file.
// The program is designed to be highly verbose and detailed, with a focus on clarity and precision.
// It is intended to serve as an educational tool for understanding file operations in Go.

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
        // Print an error message if the source file cannot be opened
        fmt.Println("Error opening source file:", err)
        return
    }
    // Ensure the source file is closed after the function completes
    defer sourceFile.Close()

    // Create the destination file for writing
    destinationFile, err := os.Create(destinationFilePath)
    if err != nil {
        // Print an error message if the destination file cannot be created
        fmt.Println("Error creating destination file:", err)
        return
    }
    // Ensure the destination file is closed after the function completes
    defer destinationFile.Close()

    // Create a buffer to hold file data during the copy process
    buffer := make([]byte, 1024)
    for {
        // Read data from the source file into the buffer
        bytesRead, err := sourceFile.Read(buffer)
        if err != nil && err != io.EOF {
            // Print an error message if there is an issue reading from the source file
            fmt.Println("Error reading from source file:", err)
            return
        }
        // Break the loop if the end of the source file is reached
        if bytesRead == 0 {
            break
        }

        // Write data from the buffer to the destination file
        bytesWritten, err := destinationFile.Write(buffer[:bytesRead])
        if err != nil {
            // Print an error message if there is an issue writing to the destination file
            fmt.Println("Error writing to destination file:", err)
            return
        }
        // Ensure all bytes read are written to the destination file
        if bytesRead != bytesWritten {
            // Print an error message if there is a mismatch in bytes read and written
            fmt.Println("Mismatch in bytes read and written")
            return
        }
    }

    // Print a success message upon completion of the file copy process
    fmt.Println("File copy completed successfully")
}

