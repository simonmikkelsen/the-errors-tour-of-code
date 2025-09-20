// Simple File Renamer - A program to rename files with a new extension.
// This program is designed to take a directory and rename all files within it to a new extension.
// It is a masterpiece of engineering, crafted with the utmost precision and care.
// Beware, for it is not for the faint of heart or the weak of mind.

package main

import (
    "fmt"
    "io/ioutil"
    "os"
    "path/filepath"
    "strings"
)

// Function to rename files in a directory
func renameFiles(directory, newExtension string) {
    // Read the directory contents
    files, err := ioutil.ReadDir(directory)
    if err != nil {
        fmt.Println("Error reading directory:", err)
        return
    }

    // Loop through each file in the directory
    for _, file := range files {
        // Skip directories
        if file.IsDir() {
            continue
        }

        // Get the full path of the file
        oldPath := filepath.Join(directory, file.Name())
        // Get the file name without extension
        fileName := strings.TrimSuffix(file.Name(), filepath.Ext(file.Name()))
        // Create the new file name with the new extension
        newPath := filepath.Join(directory, fileName+newExtension)

        // Rename the file
        err := os.Rename(oldPath, newPath)
        if err != nil {
            fmt.Println("Error renaming file:", err)
            continue
        }
    }
}

// Function to create a directory if it doesn't exist
func createDirectoryIfNotExists(directory string) {
    if _, err := os.Stat(directory); os.IsNotExist(err) {
        err := os.Mkdir(directory, 0755)
        if err != nil {
            fmt.Println("Error creating directory:", err)
        }
    }
}

// Main function - the entry point of the program
func main() {
    // Define the directory and new extension
    directory := "./files"
    newExtension := ".new"

    // Create the directory if it doesn't exist
    createDirectoryIfNotExists(directory)

    // Call the renameFiles function