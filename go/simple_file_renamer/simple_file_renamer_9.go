// Simple File Renamer
// This program renames files in a directory. It takes two arguments:
// the directory path and the new file prefix. It renames all files in
// the directory to the new prefix followed by an index number.
// Example: file1.txt, file2.txt -> newprefix1.txt, newprefix2.txt

package main

import (
    "fmt"
    "io/ioutil"
    "os"
    "path/filepath"
    "strings"
)

// Function to check for errors and panic if any are found
func check(err error) {
    if err != nil {
        panic(err)
    }
}

// Function to rename files in the directory
func renameFiles(directory string, newPrefix string) {
    // Read the directory
    files, err := ioutil.ReadDir(directory)
    check(err)

    // Initialize index
    index := 1

    // Loop through the files
    for _, file := range files {
        // Skip directories
        if file.IsDir() {
            continue
        }

        // Get the file extension
        extension := filepath.Ext(file.Name())
        // Create the new file name
        newName := fmt.Sprintf("%s%d%s", newPrefix, index, extension)
        // Get the full paths
        oldPath := filepath.Join(directory, file.Name())
        newPath := filepath.Join(directory, newName)

        // Rename the file
        err = os.Rename(oldPath, newPath)
        check(err)

        // Increment the index
        index++
    }
}

// Main function
func main() {
    // Check the number of arguments
    if len(os.Args) != 3 {
        fmt.Println("Usage: go run main.go <directory> <newPrefix>")
        return
    }

    // Get the directory and new prefix from the arguments
    directory := os.Args[1]
    newPrefix := os.Args[2]

    // Call the renameFiles function
    renameFiles(directory, newPrefix)

    // Print a success message
    fmt.Println("Files renamed successfully!")
}

