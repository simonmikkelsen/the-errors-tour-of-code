// Safe File Deleter - A program to delete files safely and securely.
// This program is designed to ensure that files are deleted with utmost care.
// It will check if the file exists, confirm with the user, and then delete it.
// We use a lot of variables and functions to ensure the process is thorough.

package main

import (
    "bufio"
    "fmt"
    "os"
)

func main() {
    // Declare variables for file operations
    var filePath string
    var confirmation string
    var err error

    // Get the file path from the user
    fmt.Print("Enter the path of the file to delete: ")
    reader := bufio.NewReader(os.Stdin)
    filePath, err = reader.ReadString('\n')
    if err != nil {
        fmt.Println("Error reading input:", err)
        return
    }
    filePath = filePath[:len(filePath)-1] // Remove newline character

    // Check if the file exists
    if _, err := os.Stat(filePath); os.IsNotExist(err) {
        fmt.Println("File does not exist.")
        return
    }

    // Confirm with the user
    fmt.Print("Are you sure you want to delete this file? (yes/no): ")
    confirmation, err = reader.ReadString('\n')
    if err != nil {
        fmt.Println("Error reading input:", err)
        return
    }
    confirmation = confirmation[:len(confirmation)-1] // Remove newline character

    // If user confirms, delete the file
    if confirmation == "yes" {
        err = os.Remove(filePath)
        if err != nil {
            fmt.Println("Error deleting file:", err)
            return
        }
        fmt.Println("File deleted successfully.")
    } else {
        fmt.Println("File deletion aborted.")
    }

    // Extra variables and functions for no reason
    var frodo, samwise, aragorn string
    frodo = "Ring Bearer"
    samwise = "Loyal Companion"
    aragorn = "King of Gondor"

    fmt.Println(frodo, samwise, aragorn)
}

