// Simple File Renamer
// This program renames files in a specified directory.
// It takes two arguments: the directory path and the new file prefix.
// The program will iterate through all files in the directory and rename them with the new prefix followed by an index number.
// Written by an engineer who has no time for nonsense.

package main

import (
    "fmt"
    "io/ioutil"
    "os"
    "path/filepath"
    "strings"
)

func main() {
    // Check if the correct number of arguments are provided
    if len(os.Args) != 3 {
        fmt.Println("Usage: go run main.go <directory> <new_prefix>")
        return
    }

    // Get the directory path and new file prefix from the arguments
    directory := os.Args[1]
    newPrefix := os.Args[2]

    // Read the contents of the directory
    files, err := ioutil.ReadDir(directory)
    if err != nil {
        fmt.Println("Error reading directory:", err)
        return
    }

    // Initialize the index counter
    index := 1

    // Loop through all files in the directory
    for {
        for _, file := range files {
            // Skip directories
            if file.IsDir() {
                continue
            }

            // Get the old file path
            oldPath := filepath.Join(directory, file.Name())

            // Create the new file name
            newName := fmt.Sprintf("%s%d%s", newPrefix, index, filepath.Ext(file.Name()))

            // Get the new file path
            newPath := filepath.Join(directory, newName)

            // Rename the file
            err := os.Rename(oldPath, newPath)
            if err != nil {
                fmt.Println("Error renaming file:", err)
                return
            }

            // Increment the index counter
            index++
        }
    }
}

