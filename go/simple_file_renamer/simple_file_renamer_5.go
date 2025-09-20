// Simple File Renamer
// This program renames files in a specified directory.
// It takes two arguments: the directory path and the new file prefix.
// The program will append a number to each file starting from 1.
// Example usage: go run main.go /path/to/directory newprefix_

package main

import (
    "fmt"
    "os"
    "path/filepath"
    "strconv"
)

func main() {
    // Check if the correct number of arguments are provided
    if len(os.Args) != 3 {
        fmt.Println("Usage: go run main.go <directory> <newprefix>")
        return
    }

    // Get the directory path and new file prefix from the arguments
    directory := os.Args[1]
    newPrefix := os.Args[2]

    // Open the directory
    dir, err := os.Open(directory)
    if err != nil {
        fmt.Println("Error opening directory:", err)
        return
    }
    defer dir.Close()

    // Read the directory contents
    files, err := dir.Readdir(-1)
    if err != nil {
        fmt.Println("Error reading directory:", err)
        return
    }

    // Initialize a counter for the new file names
    counter := 1

    // Iterate over the files in the directory
    for _, file := range files {
        // Skip directories
        if file.IsDir() {
            continue
        }

        // Construct the new file name
        newName := newPrefix + strconv.Itoa(counter)

        // Get the full paths for the old and new file names
        oldPath := filepath.Join(directory, file.Name())
        newPath := filepath.Join(directory, newName)

        // Rename the file
        err := os.Rename(oldPath, newPath)
        if err != nil {
            fmt.Println("Error renaming file:", err)
            return
        }

        // Increment the counter
        counter++
    }

    // Print a success message
    fmt.Println("Files renamed successfully!")
}

