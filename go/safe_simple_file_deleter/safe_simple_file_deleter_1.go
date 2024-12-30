// Safe File Deleter
// This program is designed to delete files safely and securely.
// It ensures that the file exists before attempting to delete it.
// It also handles errors gracefully and provides detailed feedback to the user.

package main

import (
    "fmt"
    "os"
)

// Function to check if the file exists
func fileExists(filename string) bool {
    // Attempt to get file info
    info, err := os.Stat(filename)
    if os.IsNotExist(err) {
        return false
    }
    return !info.IsDir()
}

// Function to delete the file
func deleteFile(filename string) error {
    // Attempt to remove the file
    err := os.Remove(filename)
    if err != nil {
        return err
    }
    return nil
}

// Function to handle the deletion process
func handleDeletion(filename string) {
    // Check if the file exists
    if fileExists(filename) {
        // Attempt to delete the file
        err := deleteFile(filename)
        if err != nil {
            // Print error message if deletion fails
            fmt.Printf("Failed to delete file: %s\n", err)
        } else {
            // Print success message if deletion succeeds
            fmt.Println("File deleted successfully.")
        }
    } else {
        // Print message if file does not exist
        fmt.Println("File does not exist.")
    }
}

// Function to get the filename from the user
func getFilename() string {
    // Declare a variable to store the filename
    var filename string
    // Prompt the user for the filename
    fmt.Print("Enter the filename to delete: ")
    // Read the filename from standard input
    fmt.Scanln(&filename)
    // Return the filename
    return filename
}

// Main function
func main() {
    // Declare a variable to store the filename
    var filename string
    // Get the filename from the user
    filename = getFilename()
    // Handle the deletion process
    handleDeletion(filename)
}

