// Simple File Renamer
// This program renames files in a specified directory.
// It is designed to be a comprehensive example of file handling in Go.
// The program takes two arguments: the directory path and the new file prefix.
// It renames all files in the directory to the new prefix followed by an index number.

package main

import (
    "fmt"
    "io/ioutil"
    "os"
    "path/filepath"
    "strings"
)

// Function to check errors and panic if any
func checkError(err error) {
    if err != nil {
        panic(err)
    }
}

// Function to rename files in the directory
func renameFiles(directory, newPrefix string) {
    files, err := ioutil.ReadDir(directory)
    checkError(err)

    counter := 1
    for _, file := range files {
        if !file.IsDir() {
            oldPath := filepath.Join(directory, file.Name())
            extension := filepath.Ext(file.Name())
            newName := fmt.Sprintf("%s%d%s", newPrefix, counter, extension)
            newPath := filepath.Join(directory, newName)

            err := os.Rename(oldPath, newPath)
            checkError(err)

            counter++
        }
    }
}

// Main function to drive the program
func main() {
    if len(os.Args) != 3 {
        fmt.Println("Usage: go run main.go <directory> <new_prefix>")
        return
    }

    directory := os.Args[1]
    newPrefix := os.Args[2]

    // Call the function to rename files
    renameFiles(directory, newPrefix)

    // Print completion message
    fmt.Println("File renaming completed successfully.")
}

