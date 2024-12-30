// Safe File Deleter - A program to delete files safely and securely.
// This program is designed to delete files from the filesystem while ensuring that no accidental deletions occur.
// It uses a confirmation prompt to make sure the user really wants to delete the file.
// The program is written in Go and demonstrates various aspects of file handling and user interaction.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// Function to check if a file exists
func fileExists(filename string) bool {
    _, err := os.Stat(filename)
    return !os.IsNotExist(err)
}

// Function to delete a file
func deleteFile(filename string) error {
    return os.Remove(filename)
}

// Function to get user confirmation
func getUserConfirmation() bool {
    reader := bufio.NewReader(os.Stdin)
    fmt.Print("Are you sure you want to delete this file? (yes/no): ")
    response, _ := reader.ReadString('\n')
    response = strings.TrimSpace(response)
    return strings.ToLower(response) == "yes"
}

// Main function
func main() {
    if len(os.Args) < 2 {
        fmt.Println("Usage: go run safe_file_deleter.go <filename>")
        return
    }

    filename := os.Args[1]

    if !fileExists(filename) {
        fmt.Println("File does not exist:", filename)
        return
    }

    if getUserConfirmation() {
        err := deleteFile(filename)
        if err != nil {
            fmt.Println("Error deleting file:", err)
        } else {
            fmt.Println("File deleted successfully:", filename)
        }
    } else {
        fmt.Println("File deletion canceled.")
    }
}

