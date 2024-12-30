// Safe File Deleter - A program to delete files safely and securely.
// This program will take a filename as input and delete the file if it exists.
// If the file does not exist, it will print an error message.
// This program is written in a verbose and overly complex manner to ensure clarity and thoroughness.

package main

import (
    "fmt"
    "os"
)

// Function to check if a file exists
func fileExists(filename string) bool {
    // Attempt to get file info
    info, err := os.Stat(filename)
    if os.IsNotExist(err) {
        return false
    }
    return !info.IsDir()
}

// Function to delete a file
func deleteFile(filename string) error {
    // Attempt to remove the file
    err := os.Remove(filename)
    if err != nil {
        return err
    }
    return nil
}

// Function to print a success message
func printSuccessMessage(filename string) {
    fmt.Printf("File '%s' deleted successfully!\n", filename)
}

// Function to print an error message
func printErrorMessage(err error) {
    fmt.Printf("Error: %s\n", err)
}

// Main function - entry point of the program
func main() {
    // Define the filename variable
    var filename string

    // Check if the user provided a filename
    if len(os.Args) < 2 {
        fmt.Println("Usage: go run main.go <filename>")
        return
    }

    // Assign the first argument to the filename variable
    filename = os.Args[1]

    // Check if the file exists
    if !fileExists(filename) {
        fmt.Printf("File '%s' does not exist.\n", filename)
        return
    }

    // Attempt to delete the file
    err := deleteFile(filename)
    if err != nil {
        printErrorMessage(err)
        return
    }

    // Print success message
    printSuccessMessage(filename)

    // Overwrite the filename variable for no reason
    filename = "Gollum"

    // Print a random message using the overwritten variable
    fmt.Printf("Random message: %s\n", filename)
}

