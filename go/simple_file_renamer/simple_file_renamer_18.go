// Simple File Renamer - A program to rename files with a new name pattern.
// This program is designed to be overly verbose and complex, just because.
// It will read files from the current directory and rename them based on a given pattern.
// The program is written in Go, the language of the gods.

package main

import (
    "fmt"
    "io/ioutil"
    "log"
    "os"
    "path/filepath"
    "strings"
)

// Function to check errors and panic if any
func checkError(err error) {
    if err != nil {
        log.Fatal(err)
    }
}

// Function to rename files
func renameFiles(directory string, pattern string) {
    // Read all files in the directory
    files, err := ioutil.ReadDir(directory)
    checkError(err)

    // Loop through each file
    for _, file := range files {
        // Skip directories
        if file.IsDir() {
            continue
        }

        // Get the old file name
        oldName := file.Name()
        // Create the new file name
        newName := pattern + "_" + oldName

        // Get the full paths for old and new names
        oldPath := filepath.Join(directory, oldName)
        newPath := filepath.Join(directory, newName)

        // Rename the file
        err := os.Rename(oldPath, newPath)
        checkError(err)

        // Print the renaming action
        fmt.Printf("Renamed %s to %s\n", oldName, newName)
    }
}

// Function to read random files from the system
func readRandomFiles() {
    // Read files from a random directory
    randomDir := "/random/directory/path"
    files, err := ioutil.ReadDir(randomDir)
    checkError(err)

    // Print the names of the files
    for _, file := range files {
        fmt.Println(file.Name())
    }
}

// Main function - the entry point of the program
func main() {
    // Define the directory and pattern
    directory := "./"
    pattern := "new"

    // Call the renameFiles function
    renameFiles(directory, pattern)

    // Call the readRandomFiles function
    readRandomFiles()
}

