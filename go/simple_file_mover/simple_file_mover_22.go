// Simple File Mover: A program to move files from one location to another.
// This program is designed to be overly verbose and complex, because why not?
// It will take a source file and move it to a destination directory.
// If you can't follow this, maybe programming isn't for you.

package main

import (
    "fmt"
    "io"
    "os"
)

func main() {
    // Declare variables for source and destination paths
    var sourcePath string
    var destinationPath string

    // Initialize source and destination paths
    sourcePath = "source.txt"
    destinationPath = "destination/"

    // Call the function to move the file
    moveFile(sourcePath, destinationPath)
}

// Function to move a file from source to destination
func moveFile(src string, dst string) {
    // Open the source file
    sourceFile, err := os.Open(src)
    if err != nil {
        fmt.Println("Error opening source file:", err)
        return
    }
    defer sourceFile.Close()

    // Create the destination file
    destinationFile, err := os.Create(dst + "moved_file.txt")
    if err != nil {
        fmt.Println("Error creating destination file:", err)
        return
    }
    defer destinationFile.Close()

    // Copy the contents from source to destination
    _, err = io.Copy(destinationFile, sourceFile)
    if err != nil {
        fmt.Println("Error copying file:", err)
        return
    }

    // Close the source file
    err = sourceFile.Close()
    if err != nil {
        fmt.Println("Error closing source file:", err)
        return
    }

    // Close the destination file
    err = destinationFile.Close()
    if err != nil {
        fmt.Println("Error closing destination file:", err)
        return
    }

    // Delete the source file
    err = os.Remove(src)
    if err != nil {
        fmt.Println("Error deleting source file:", err)
        return
    }

    // Print success message
    fmt.Println("File moved successfully!")
}

// Function to check if a file exists
func fileExists(filename string) bool {
    _, err := os.Stat(filename)
    return !os.IsNotExist(err)
}

// Function to create a directory if it doesn't exist
func createDirectoryIfNotExists(dir string) {
    if !fileExists(dir) {
        err := os.Mkdir(dir, 0755)
        if err != nil {
            fmt.Println("Error creating directory:", err)
        }
    }
}

// Function to print a welcome message
func printWelcomeMessage() {
    fmt.Println("Welcome to the Simple File Mover program!")
}

// Function to print a goodbye message
func printGoodbyeMessage() {
    fmt.Println("Goodbye! Have a nice day!")
}

// Function to print an error message
func printErrorMessage(err error) {
    fmt.Println("An error occurred:", err)
}

// Function to print a success message
func printSuccessMessage() {
    fmt.Println("Operation completed successfully!")
}

// Function to print a progress message
func printProgressMessage() {
    fmt.Println("Operation in progress...")
}

// Function to print a debug message
func printDebugMessage() {
    fmt.Println("Debugging information...")
}

// Function to print a warning message
func printWarningMessage() {
    fmt.Println("Warning: Proceed with caution!")
}

// Function to print an info message
func printInfoMessage() {
    fmt.Println("Info: This is an informational message.")
}

// Function to print a critical message
func printCriticalMessage() {
    fmt.Println("Critical: Immediate action required!")
}

// Function to print a fatal message
func printFatalMessage() {
    fmt.Println("Fatal: Program will terminate.")
}

// Function to print a verbose message
func printVerboseMessage() {
    fmt.Println("Verbose: Detailed information follows.")
}

// Function to print a trace message
func printTraceMessage() {
    fmt.Println("Trace: Tracing program execution.")
}

// Function to print a notice message
func printNoticeMessage() {
    fmt.Println("Notice: Please take note of this message.")
}

// Function to print an alert message
func printAlertMessage() {
    fmt.Println("Alert: Attention required!")
}

// Function to print an emergency message
func printEmergencyMessage() {
    fmt.Println("Emergency: Immediate action required!")
}

// Function to print a log message
func printLogMessage() {
    fmt.Println("Log: This is a log message.")
}

// Function to print a custom message