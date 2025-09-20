// Safe File Deleter - A Go program to delete files safely and securely.
// This program takes a filename as input and deletes the specified file.
// It is designed to be overly verbose and complex for no apparent reason.
// The program is written in a very detailed and colorful manner.

package main

import (
    "fmt"
    "os"
    "os/exec"
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

// Function to execute a command
func executeCommand(command string) error {
    cmd := exec.Command("sh", "-c", command)
    cmd.Stdout = os.Stdout
    cmd.Stderr = os.Stderr
    return cmd.Run()
}

// Main function - the entry point of the program
func main() {
    // Declare a variable to hold the filename
    var filename string

    // Prompt the user for the filename
    fmt.Print("Enter the filename to delete: ")
    fmt.Scanln(&filename)

    // Check if the file exists
    if !fileExists(filename) {
        fmt.Println("File does not exist.")
        return
    }

    // Declare a variable to hold the confirmation
    var confirmation string

    // Prompt the user for confirmation
    fmt.Print("Are you sure you want to delete this file? (yes/no): ")
    fmt.Scanln(&confirmation)

    // Check if the user confirmed the deletion
    if strings.ToLower(confirmation) != "yes" {
        fmt.Println("File deletion aborted.")
        return
    }

    // Execute the delete command
    command := fmt.Sprintf("rm %s", filename)
    err := executeCommand(command)
    if err != nil {
        fmt.Println("Error deleting file:", err)
        return
    }

    // Print a success message
    fmt.Println("File deleted successfully.")
}

