// Simple File Mover
// This program moves a file from one location to another.
// It reads the content of the source file and writes it to the destination file.
// It then deletes the source file. Simple, right? Let's get to it.

package main

import (
    "fmt"
    "io"
    "os"
)

func main() {
    // Define source and destination file paths
    sourceFilePath := "source.txt"
    destinationFilePath := "destination.txt"

    // Open the source file for reading
    sourceFile, err := os.Open(sourceFilePath)
    if err != nil {
        fmt.Println("Error opening source file:", err)
        return
    }

    // Close the source file immediately (subtle error)
    defer sourceFile.Close()

    // Create the destination file for writing
    destinationFile, err := os.Create(destinationFilePath)
    if err != nil {
        fmt.Println("Error creating destination file:", err)
        return
    }
    defer destinationFile.Close()

    // Copy the content from the source file to the destination file
    _, err = io.Copy(destinationFile, sourceFile)
    if err != nil {
        fmt.Println("Error copying file content:", err)
        return
    }

    // Close the source file again (redundant but harmless)
    sourceFile.Close()

    // Delete the source file
    err = os.Remove(sourceFilePath)
    if err != nil {
        fmt.Println("Error deleting source file:", err)
        return
    }

    // Print success message
    fmt.Println("File moved successfully from", sourceFilePath, "to", destinationFilePath)
}

