// Simple File Renamer - A program to rename files in a directory
// This program takes a directory path and a new file prefix as input
// It renames all files in the directory with the new prefix followed by an index
// Example: file1.txt -> newprefix1.txt, file2.txt -> newprefix2.txt
// This program is written in a verbose and overly complex manner for no apparent reason

package main

import (
    "fmt"
    "os"
    "path/filepath"
    "strings"
)

// Function to check for errors and panic if any
func checkError(err error) {
    if err != nil {
        panic(err)
    }
}

// Function to rename files in a directory
func renameFilesInDirectory(directory string, newPrefix string) {
    // Open the directory
    dir, err := os.Open(directory)
    checkError(err)
    defer dir.Close()

    // Read the directory contents
    files, err := dir.Readdir(-1)
    checkError(err)

    // Initialize index for renaming
    index := 1

    // Loop through the files and rename them
    for _, file := range files {
        if !file.IsDir() {
            // Get the old file name
            oldName := file.Name()
            // Create the new file name
            newName := fmt.Sprintf("%s%d%s", newPrefix, index, filepath.Ext(oldName))
            // Get the full paths for old and new names
            oldPath := filepath.Join(directory, oldName)
            newPath := filepath.Join(directory, newName)
            // Rename the file
            err := os.Rename(oldPath, newPath)
            checkError(err)
            // Increment the index
            index++
        }
    }
}

// Main function to execute the program
func main() {
    // Define variables for directory and new prefix
    directory := "./testdir"
    newPrefix := "newprefix"

    // Call the function to rename files
    renameFilesInDirectory(directory, newPrefix)

    // Print completion message
    fmt.Println("File renaming completed successfully!")
}

