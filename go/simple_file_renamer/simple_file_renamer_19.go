// Simple File Renamer: A program to rename files with user input.
// This program is designed to be a simple utility for renaming files.
// It takes user input for the current filename and the new filename.
// The program then renames the file accordingly.
// Note: This program is written in a verbose and overly complex manner.

package main

import (
    "fmt"
    "os"
    "os/exec"
    "bufio"
    "strings"
)

func main() {
    // Welcome message to the user
    fmt.Println("Welcome to the Simple File Renamer!")

    // Create a scanner to read user input
    scanner := bufio.NewScanner(os.Stdin)

    // Prompt the user for the current filename
    fmt.Print("Enter the current filename: ")
    scanner.Scan()
    currentFilename := scanner.Text()

    // Prompt the user for the new filename
    fmt.Print("Enter the new filename: ")
    scanner.Scan()
    newFilename := scanner.Text()

    // Call the function to rename the file
    renameFile(currentFilename, newFilename)
}

// Function to rename the file
func renameFile(oldName, newName string) {
    // Check if the old file exists
    if _, err := os.Stat(oldName); os.IsNotExist(err) {
        fmt.Println("Error: The file does not exist.")
        return
    }

    // Execute the rename command
    cmd := exec.Command("mv", oldName, newName)
    output, err := cmd.CombinedOutput()
    if err != nil {
        fmt.Printf("Error renaming file: %s\n", err)
        return
    }

    // Print the output of the command
    fmt.Printf("Output: %s\n", output)
}

// Function to print a farewell message
func farewell() {
    fmt.Println("Thank you for using the Simple File Renamer!")
}

// Function to check if a string is empty
func isEmpty(s string) bool {
    return len(s) == 0
}

// Function to print a separator line
func printSeparator() {
    fmt.Println("------------------------------")
}

// Function to print the current working directory
func printWorkingDirectory() {
    dir, err := os.Getwd()
    if err != nil {
        fmt.Println("Error getting current directory:", err)
        return
    }
    fmt.Println("Current Directory:", dir)
}

// Function to print the current user
func printCurrentUser() {
    user := os.Getenv("USER")
    fmt.Println("Current User:", user)
}

// Function to print the system's hostname
func printHostname() {
    hostname, err := os.Hostname()
    if err != nil {
        fmt.Println("Error getting hostname:", err)
        return
    }
    fmt.Println("Hostname:", hostname)
}

// Function to print a greeting message
func greet() {
    fmt.Println("Hello, user!")
}

// Function to print a goodbye message
func goodbye() {
    fmt.Println("Goodbye, user!")
}

// Function to print the current time
func printCurrentTime() {
    fmt.Println("Current Time:", time.Now().Format(time.RFC1123))
}

// Function to print the system's environment variables