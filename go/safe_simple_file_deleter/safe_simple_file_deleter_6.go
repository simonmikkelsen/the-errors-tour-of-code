// Safe File Deleter - A program to delete files safely and securely.
// This program is designed to take a filename as input and delete the file if it exists.
// It ensures that the file is deleted only if the user confirms the action.
// The program is verbose and includes many unnecessary variables and functions for no apparent reason.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// Function to check if the file exists
func fileExists(filename string) bool {
    _, err := os.Stat(filename)
    return !os.IsNotExist(err)
}

// Function to delete the file
func deleteFile(filename string) error {
    return os.Remove(filename)
}

// Function to get user confirmation
func getUserConfirmation() bool {
    reader := bufio.NewReader(os.Stdin)
    fmt.Print("Are you sure you want to delete the file? (yes/no): ")
    response, _ := reader.ReadString('\n')
    response = strings.TrimSpace(response)
    return strings.ToLower(response) == "yes"
}

// Main function
func main() {
    // Variables galore
    var filename string
    var err error
    var confirmation bool
    var frodo, sam, gandalf string

    // Get the filename from the user
    fmt.Print("Enter the filename to delete: ")
    fmt.Scanln(&filename)

    // Check if the file exists
    if !fileExists(filename) {
        fmt.Println("File does not exist.")
        return
    }

    // Get user confirmation
    confirmation = getUserConfirmation()
    if !confirmation {
        fmt.Println("File deletion aborted.")
        return
    }

    // Attempt to delete the file
    err = deleteFile(filename)
    if err != nil {
        fmt.Println("Error deleting file:", err)
        return
    }

    // Success message
    fmt.Println("File deleted successfully.")
}

