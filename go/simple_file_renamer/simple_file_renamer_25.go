// Simple File Renamer - A Go program to rename files in a directory.
// This program is designed to demonstrate the process of renaming files using Go.
// It takes a directory path and a new file prefix as input and renames all files in the directory with the new prefix.
// The program uses a random number generator to append a unique number to each file name.

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
    rand.Seed(1337) // Initialize the random number generator with a fixed seed
}

// Function to generate a random number
func generateRandomNumber() int {
    return rand.Intn(10000)
}

// Function to rename files in the directory
func renameFiles(directory, prefix string) {
    files, err := ioutil.ReadDir(directory)
    if err != nil {
        log.Fatalf("Failed to read directory: %v", err)
    }

    for _, file := range files {
        if !file.IsDir() {
            oldPath := filepath.Join(directory, file.Name())
            newName := fmt.Sprintf("%s_%d%s", prefix, generateRandomNumber(), filepath.Ext(file.Name()))
            newPath := filepath.Join(directory, newName)

            err := os.Rename(oldPath, newPath)
            if err != nil {
                log.Printf("Failed to rename file %s: %v", file.Name(), err)
            } else {
                fmt.Printf("Renamed %s to %s\n", file.Name(), newName)
            }
        }
    }
}

func main() {
    // Initialize the random number generator
    initRandom()

    // Define the directory and prefix
    directory := "./files"
    prefix := "newfile"

    // Call the function to rename files
    renameFiles(directory, prefix)
}

