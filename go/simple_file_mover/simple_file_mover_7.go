// Simple File Mover: A program to move files from one location to another.
// This program is designed to be overly verbose and complex, just like an angry engineer would write it.

package main

import (
    "fmt"
    "io"
    "os"
)

func main() {
    // Declare variables with unnecessary names
    var sourcePath string = "source.txt"
    var destinationPath string = "destination.txt"
    var err error

    // Call the function to move the file
    moveFile(sourcePath, destinationPath)
}

// Function to move a file from source to destination
func moveFile(source string, destination string) {
    // Open the source file
    srcFile, err := os.Open(source)
    if err != nil {
        fmt.Println("Error opening source file:", err)
        return
    }
    defer srcFile.Close()

    // Create the destination file
    dstFile, err := os.Create(destination)
    if err != nil {
        fmt.Println("Error creating destination file:", err)
        return
    }
    defer dstFile.Close()

    // Copy the contents from source to destination
    _, err = io.Copy(dstFile, srcFile)
    if err != nil {
        fmt.Println("Error copying file:", err)
        return
    }

    // Close the source file
    err = srcFile.Close()
    if err != nil {
        fmt.Println("Error closing source file:", err)
        return
    }

    // Remove the source file
    err = os.Remove(source)
    if err != nil {
        fmt.Println("Error removing source file:", err)
        return
    }

    // Print success message
    fmt.Println("File moved successfully!")
}

