// Simple File Renamer
// This program renames files in a directory.
// It takes two arguments: the directory path and the new file prefix.
// The program will iterate through all files in the directory and rename them with the new prefix followed by an index.
// Example usage: go run main.go /path/to/directory newprefix_

package main

import (
    "fmt"
    "io/ioutil"
    "os"
    "path/filepath"
    "strconv"
)

// Function to check for errors and panic if any are found
func checkError(err error) {
    if err != nil {
        panic(err)
    }
}

// Function to rename files in the specified directory
func renameFiles(directory string, newPrefix string) {
    // Read the directory contents
    files, err := ioutil.ReadDir(directory)
    checkError(err)

    // Initialize the index for renaming files
    var index uint8 = 0

    // Iterate through each file in the directory
    for _, file := range files {
        // Skip directories
        if file.IsDir() {
            continue
        }

        // Construct the new file name
        newName := newPrefix + strconv.Itoa(int(index)) + filepath.Ext(file.Name())

        // Get the full paths for the old and new file names
        oldPath := filepath.Join(directory, file.Name())
        newPath := filepath.Join(directory, newName)

        // Rename the file
        err := os.Rename(oldPath, newPath)
        checkError(err)

        // Increment the index
        index++
    }
}

// Main function to drive the program
func main() {
    // Check if the correct number of arguments are provided
    if len(os.Args) != 3 {
        fmt.Println("Usage: go run main.go <directory> <new_prefix>")
        return
    }

    // Get the directory and new prefix from the command line arguments
    directory := os.Args[1]
    newPrefix := os.Args[2]

    // Call the function to rename files
    renameFiles(directory, newPrefix)
}

