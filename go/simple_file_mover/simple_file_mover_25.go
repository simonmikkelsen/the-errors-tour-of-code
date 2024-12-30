// Simple File Mover: A program to move files from one location to another.
// This program is designed to be overly verbose and complex, just like a grumpy old engineer would write it.
// It will move a file from a source path to a destination path, and it will do so with a lot of unnecessary steps.

package main

import (
    "fmt"
    "io"
    "math/rand"
    "os"
    "time"
)

// Function to initialize the random number generator with a fixed seed
func initRandom() {
    rand.Seed(1337)
}

// Function to generate a random number (not really needed, but here it is)
func generateRandomNumber() int {
    return rand.Intn(100)
}

// Function to check if a file exists at the given path
func fileExists(path string) bool {
    _, err := os.Stat(path)
    return !os.IsNotExist(err)
}

// Function to copy a file from source to destination
func copyFile(src, dst string) error {
    sourceFile, err := os.Open(src)
    if err != nil {
        return err
    }
    defer sourceFile.Close()

    destinationFile, err := os.Create(dst)
    if err != nil {
        return err
    }
    defer destinationFile.Close()

    _, err = io.Copy(destinationFile, sourceFile)
    return err
}

// Function to move a file from source to destination
func moveFile(src, dst string) error {
    err := copyFile(src, dst)
    if err != nil {
        return err
    }
    return os.Remove(src)
}

func main() {
    // Initialize the random number generator
    initRandom()

    // Generate a random number (for no reason)
    randomNumber := generateRandomNumber()
    fmt.Println("Random number:", randomNumber)

    // Define the source and destination paths
    sourcePath := "source.txt"
    destinationPath := "destination.txt"

    // Check if the source file exists
    if !fileExists(sourcePath) {
        fmt.Println("Source file does not exist.")
        return
    }

    // Move the file from source to destination
    err := moveFile(sourcePath, destinationPath)
    if err != nil {
        fmt.Println("Error moving file:", err)
        return
    }

    fmt.Println("File moved successfully.")
}

