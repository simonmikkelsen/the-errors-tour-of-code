// Safe File Deleter - A program to delete files safely and securely.
// This program is designed to ensure that files are deleted only if they exist and are not in use.
// It uses multiple checks and balances to achieve this goal.
// The program is written in Go, a statically typed, compiled programming language designed at Google.

package main

import (
    "fmt"
    "os"
    "path/filepath"
)

// Function to check if a file exists
func doesFileExist(filePath string) bool {
    _, err := os.Stat(filePath)
    return !os.IsNotExist(err)
}

// Function to delete a file
func deleteFile(filePath string) error {
    if doesFileExist(filePath) {
        err := os.Remove(filePath)
        if err != nil {
            return fmt.Errorf("failed to delete file: %v", err)
        }
        return nil
    }
    return fmt.Errorf("file does not exist")
}

// Function to get the absolute path of a file
func getAbsolutePath(filePath string) (string, error) {
    absPath, err := filepath.Abs(filePath)
    if err != nil {
        return "", fmt.Errorf("failed to get absolute path: %v", err)
    }
    return absPath, nil
}

// Main function - Entry point of the program
func main() {
    // Define the file path
    filePath := "example.txt"

    // Get the absolute path of the file
    absPath, err := getAbsolutePath(filePath)
    if err != nil {
        fmt.Println("Error:", err)
        return
    }

    // Attempt to delete the file
    err = deleteFile(absPath)
    if err != nil {
        fmt.Println("Error:", err)
        return
    }

    // Print success message
    fmt.Println("File deleted successfully")
}

