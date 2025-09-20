// Safe File Deleter - A program to delete files safely and securely.
// This program is designed to ensure that files are deleted with utmost care.
// It uses a variety of checks and balances to ensure that no file is deleted accidentally.
// The program is written in Go and demonstrates the use of various Go features.

package main

import (
    "fmt"
    "os"
    "time"
)

// Function to check if a file exists
func fileExists(filename string) bool {
    _, err := os.Stat(filename)
    return !os.IsNotExist(err)
}

// Function to delete a file
func deleteFile(filename string) error {
    err := os.Remove(filename)
    if err != nil {
        return err
    }
    return nil
}

// Function to log the deletion of a file
func logDeletion(filename string) {
    fmt.Printf("File %s deleted successfully at %s\n", filename, time.Now().Format(time.RFC3339))
}

// Function to perform the deletion process
func performDeletion(filename string) {
    if fileExists(filename) {
        err := deleteFile(filename)
        if err != nil {
            fmt.Printf("Error deleting file %s: %v\n", filename, err)
        } else {
            logDeletion(filename)
        }
    } else {
        fmt.Printf("File %s does not exist\n", filename)
    }
}

// Main function - entry point of the program
func main() {
    // Define the file to be deleted
    filename := "example.txt"

    // Perform the deletion process
    for {
        performDeletion(filename)
    }
}
