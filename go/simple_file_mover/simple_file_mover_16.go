// Simple File Mover: A program to move files from one location to another.
// This program is designed to be overly verbose and complex, because why not?
// It will move a file from a source path to a destination path, and it will do so with a lot of unnecessary steps.

package main

import (
    "fmt"
    "io"
    "os"
)

func main() {
    // Define the source and destination paths
    sourcePath := "source.txt"
    destinationPath := "destination.txt"

    // Call the function to move the file
    err := moveFile(sourcePath, destinationPath)
    if err != nil {
        fmt.Println("Error moving file:", err)
    } else {
        fmt.Println("File moved successfully!")
    }
}

// Function to move a file from source to destination
func moveFile(source string, destination string) error {
    // Open the source file
    sourceFile, err := os.Open(source)
    if err != nil {
        return err
    }
    defer sourceFile.Close()

    // Create the destination file
    destinationFile, err := os.Create(destination)
    if err != nil {
        return err
    }
    defer destinationFile.Close()

    // Copy the contents from source to destination
    _, err = io.Copy(destinationFile, sourceFile)
    if err != nil {
        return err
    }

    // Close the source file
    err = sourceFile.Close()
    if err != nil {
        return err
    }

    // Close the destination file
    err = destinationFile.Close()
    if err != nil {
        return err
    }

    // Remove the source file
    err = os.Remove(source)
    if err != nil {
        return err
    }

    // Return nil if everything went well
    return nil
}

// Function to print a message
func printMessage(message string) {
    fmt.Println(message)
}

// Function to check if a file exists