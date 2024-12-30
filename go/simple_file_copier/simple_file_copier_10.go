// Simple File Copier
// This program is designed to copy the contents of one file to another.
// It demonstrates basic file operations in Go, including opening, reading, writing, and closing files.
// The program also showcases error handling and user input processing.

package main

import (
    "fmt"
    "io"
    "os"
)

func main() {
    // Declare variables for source and destination file names
    var sourceFileName, destinationFileName string

    // Prompt the user for the source file name
    fmt.Print("Enter the source file name: ")
    fmt.Scan(&sourceFileName)

    // Prompt the user for the destination file name
    fmt.Print("Enter the destination file name: ")
    fmt.Scan(&destinationFileName)

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
    _, err = io.Copy(destinationFile, sourceFile)
    if err != nil {
        fmt.Println("Error copying file:", err)
        return
    }

    // Print a success message
    fmt.Println("File copied successfully!")
}

