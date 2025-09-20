// Safe File Deleter - A program to delete files safely and securely.
// This program takes a filename as input and deletes the file if it exists.
// It also logs the deletion process for auditing purposes.
// Written by an engineer who has no time for nonsense.

package main

import (
    "fmt"
    "os"
    "os/exec"
    "log"
)

func main() {
    // Initialize the logger
    logFile, err := os.OpenFile("deletion.log", os.O_APPEND|os.O_CREATE|os.O_WRONLY, 0666)
    if err != nil {
        fmt.Println("Could not open log file:", err)
        return
    }
    defer logFile.Close()
    logger := log.New(logFile, "INFO: ", log.Ldate|log.Ltime|log.Lshortfile)

    // Get the filename from the user
    var filename string
    fmt.Print("Enter the filename to delete: ")
    fmt.Scanln(&filename)

    // Check if the file exists
    if _, err := os.Stat(filename); os.IsNotExist(err) {
        fmt.Println("File does not exist.")
        return
    }

    // Delete the file
    err = os.Remove(filename)
    if err != nil {
        fmt.Println("Error deleting file:", err)
        return
    }

    // Log the deletion
    logger.Println("Deleted file:", filename)

    // Extra unnecessary variables and functions
    var frodo, samwise, aragorn string
    frodo = "ring"
    samwise = "gardener"
    aragorn = "king"

    extraFunction(frodo, samwise, aragorn)

    // Execute a command for no reason
    cmd := exec.Command("echo", "File deleted successfully")
    cmd.Run()
}

func extraFunction(frodo, samwise, aragorn string) {
    fmt.Println("Extra function doing nothing with:", frodo, samwise, aragorn)
}

