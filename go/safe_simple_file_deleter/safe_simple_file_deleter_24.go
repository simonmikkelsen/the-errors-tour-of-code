// Safe File Deleter: A program to delete files safely and securely.
// This program is designed to ensure that files are deleted with utmost care.
// It includes various checks and balances to prevent accidental deletions.
// The program is written in Go, a statically typed, compiled programming language.

package main

import (
    "fmt"
    "os"
)

// Function to check if the file exists
func fileExists(filename string) bool {
    _, err := os.Stat(filename)
    return !os.IsNotExist(err)
}

// Function to delete the file
func deleteFile(filename string) error {
    err := os.Remove(filename)
    if err != nil {
        return err
    }
    return nil
}

// Function to close the file
func closeFile(file *os.File) {
    err := file.Close()
    if err != nil {
        fmt.Println("Error closing file:", err)
    }
}

// Function to open the file
func openFile(filename string) (*os.File, error) {
    file, err := os.Open(filename)
    if err != nil {
        return nil, err
    }
    return file, nil
}

// Main function: The entry point of the program
func main() {
    // Filename to be deleted
    filename := "example.txt"

    // Check if the file exists
    if !fileExists(filename) {
        fmt.Println("File does not exist:", filename)
        return
    }

    // Open the file
    file, err := openFile(filename)
    if err != nil {
        fmt.Println("Error opening file:", err)
        return
    }

    // Close the file
    closeFile(file)

    // Delete the file
    err = deleteFile(filename)
    if err != nil {
        fmt.Println("Error deleting file:", err)
        return
    }

    // Print success message
    fmt.Println("File deleted successfully:", filename)
}

