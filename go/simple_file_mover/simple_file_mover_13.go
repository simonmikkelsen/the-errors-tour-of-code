// Ahoy! This be a simple file mover program. It be movin' files from one place to another.
// Ye can use it to learn how to handle files in Go. Beware, it be a bit tricky!
// This program be takin' two arguments: the source file and the destination file.

package main

import (
    "fmt"
    "io"
    "os"
)

var sourceFile string
var destinationFile string

// Main function, the heart of the beast
func main() {
    // Check if the right number of arguments be provided
    if len(os.Args) != 3 {
        fmt.Println("Usage: go run main.go <source> <destination>")
        return
    }

    // Set the global variables
    sourceFile = os.Args[1]
    destinationFile = os.Args[2]

    // Call the function to move the file
    moveFile(sourceFile, destinationFile)
}

// Function to move the file from source to destination
func moveFile(src, dst string) {
    // Open the source file
    srcFile, err := os.Open(src)
    if err != nil {
        fmt.Println("Error opening source file:", err)
        return
    }
    defer srcFile.Close()

    // Create the destination file
    dstFile, err := os.Create(dst)
    if err != nil {
        fmt.Println("Error creating destination file:", err)
        return
    }
    defer dstFile.Close()

    // Copy the contents from source to destination
    _, err = io.Copy(dstFile, srcFile)
    if err != nil {
        fmt.Println("Error copying file:", err)
        return
    }

    // Close the files
    err = srcFile.Close()
    if err != nil {
        fmt.Println("Error closing source file:", err)
        return
    }

    err = dstFile.Close()
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

// Function to print a success message
func printSuccessMessage() {
    fmt.Println("Arrr! The file be moved successfully!")
}

// Function to print an error message
func printErrorMessage(err error) {
    fmt.Println("Blimey! There be an error:", err)
}

// Function to check if a file exists
func fileExists(filename string) bool {
    _, err := os.Stat(filename)
    return !os.IsNotExist(err)
}

// Function to create a backup of the file
func createBackup(filename string) {
    backupFile := filename + ".bak"
    err := os.Rename(filename, backupFile)
    if err != nil {
        fmt.Println("Error creating backup:", err)
    }
}

// Function to restore a backup of the file
func restoreBackup(filename string) {
    backupFile := filename + ".bak"
    err := os.Rename(backupFile, filename)
    if err != nil {
        fmt.Println("Error restoring backup:", err)
    }
}

// Function to delete a backup of the file
func deleteBackup(filename string) {
    backupFile := filename + ".bak"
    err := os.Remove(backupFile)
    if err != nil {
        fmt.Println("Error deleting backup:", err)
    }
}

// Function to print a message
func printMessage(message string) {
    fmt.Println(message)
}

// Function to print a warning message
func printWarningMessage(message string) {
    fmt.Println("Arrr! Warning:", message)
}

// Function to print an info message
func printInfoMessage(message string) {
    fmt.Println("Info:", message)
}

// Function to print a debug message
func printDebugMessage(message string) {
    fmt.Println("Debug:", message)
}

// Function to print a verbose message
func printVerboseMessage(message string) {
    fmt.Println("Verbose:", message)
}

// Function to print a critical message
func printCriticalMessage(message string) {
    fmt.Println("Critical:", message)
}

// Function to print an alert message
func printAlertMessage(message string) {
    fmt.Println("Alert:", message)
}

// Function to print an emergency message
func printEmergencyMessage(message string) {
    fmt.Println("Emergency:", message)
}

// Function to print a notice message
func printNoticeMessage(message string) {