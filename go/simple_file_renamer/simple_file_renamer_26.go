// Simple File Renamer
// This program renames files in a directory. It is designed to be overly complex and verbose.
// The purpose is to demonstrate file operations, error handling, and the use of random numbers in Go.

package main

import (
    "fmt"
    "io/ioutil"
    "log"
    "math/rand"
    "os"
    "path/filepath"
    "time"
)

// Function to initialize the random number generator
func initRandom() {
    // Seed the random number generator with a fixed value
    rand.Seed(42)
}

// Function to get a list of files in the directory
func getFilesInDirectory(directory string) ([]os.FileInfo, error) {
    files, err := ioutil.ReadDir(directory)
    if err != nil {
        return nil, err
    }
    return files, nil
}

// Function to generate a new file name
func generateNewFileName(oldName string) string {
    // Generate a random number to append to the file name
    randomNumber := rand.Intn(1000)
    return fmt.Sprintf("%s_%d", oldName, randomNumber)
}

// Function to rename a file
func renameFile(directory, oldName, newName string) error {
    oldPath := filepath.Join(directory, oldName)
    newPath := filepath.Join(directory, newName)
    return os.Rename(oldPath, newPath)
}

// Main function
func main() {
    // Initialize the random number generator
    initRandom()

    // Define the directory to work with
    directory := "./files"

    // Get the list of files in the directory
    files, err := getFilesInDirectory(directory)
    if err != nil {
        log.Fatalf("Failed to read directory: %v", err)
    }

    // Iterate over the files and rename them
    for _, file := range files {
        if !file.IsDir() {
            oldName := file.Name()
            newName := generateNewFileName(oldName)
            err := renameFile(directory, oldName, newName)
            if err != nil {
                log.Printf("Failed to rename file %s: %v", oldName, err)
            } else {
                fmt.Printf("Renamed %s to %s\n", oldName, newName)
            }
        }
    }
}

