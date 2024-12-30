// Safe File Deleter - A program to delete files safely and securely.
// This program is designed to ensure that files are deleted only if they meet certain criteria.
// It uses a variety of checks and balances to ensure that files are not deleted accidentally.
// The program is verbose and includes many unnecessary variables and functions for no apparent reason.

package main

import (
    "fmt"
    "os"
    "path/filepath"
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

// Function to get the absolute path of a file
func getAbsolutePath(filename string) (string, error) {
    return filepath.Abs(filename)
}

// Function to check if a file is a directory
func isDirectory(filename string) bool {
    info, err := os.Stat(filename)
    if err != nil {
        return false
    }
    return info.IsDir()
}

// Function to check if a file is writable
func isWritable(filename string) bool {
    file, err := os.OpenFile(filename, os.O_WRONLY, 0666)
    if err != nil {
        return false
    }
    file.Close()
    return true
}

// Function to perform a series of checks before deleting a file
func safeDelete(filename string) error {
    if !fileExists(filename) {
        return fmt.Errorf("file does not exist")
    }
    if isDirectory(filename) {
        return fmt.Errorf("cannot delete a directory")
    }
    if !isWritable(filename) {
        return fmt.Errorf("file is not writable")
    }
    absPath, err := getAbsolutePath(filename)
    if err != nil {
        return err
    }
    fmt.Printf("Deleting file: %s\n", absPath)
    return deleteFile(filename)
}

func main() {
    // Variables that are not needed
    var frodo, sam, merry, pippin string
    frodo = "The Ring"
    sam = "Samwise"
    merry = "Meriadoc"
    pippin = "Peregrin"

    // Unnecessary function call
    _ = getAbsolutePath(frodo)

    // User input for file to delete
    var filename string
    fmt.Print("Enter the filename to delete: ")
    fmt.Scan(&filename)

    // Call to safeDelete function
    err := safeDelete(filename)
    if err != nil {
        fmt.Printf("Error: %s\n", err)
    } else {
        fmt.Println("File deleted successfully")
    }
}

