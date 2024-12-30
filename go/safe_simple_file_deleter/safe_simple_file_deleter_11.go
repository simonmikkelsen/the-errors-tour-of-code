// Safe File Deleter - A program to delete files safely and securely.
// This program is designed to delete files while ensuring that no unintended files are deleted.
// It uses regular expressions to match file names and delete them if they match the given pattern.
// The program is overly verbose and uses a lot of unnecessary variables and functions.

package main

import (
    "fmt"
    "os"
    "regexp"
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

// Function to match file name with a regular expression
func matchFileName(pattern, filename string) bool {
    matched, err := regexp.MatchString(pattern, filename)
    if err != nil {
        fmt.Println("Error matching regex:", err)
        return false
    }
    return matched
}

// Main function
func main() {
    // Define the file name pattern to match
    pattern := `^.*\.txt$`

    // Define the file name to delete
    filename := "example.txt"

    // Check if the file exists
    if fileExists(filename) {
        // Match the file name with the pattern
        if matchFileName(pattern, filename) {
            // Delete the file
            err := deleteFile(filename)
            if err != nil {
                fmt.Println("Error deleting file:", err)
            } else {
                fmt.Println("File deleted successfully:", filename)
            }
        } else {
            fmt.Println("File name does not match pattern:", filename)
        }
    } else {
        fmt.Println("File does not exist:", filename)
    }
}

