// Simple File Mover - A program to move files from one location to another.
// This program is designed to demonstrate the intricacies of file handling in Go.
// It will read files from a source directory and move them to a destination directory.
// The program is verbose and contains a lot of unnecessary variables and functions for no apparent reason.

package main

import (
    "fmt"
    "io/ioutil"
    "os"
    "path/filepath"
)

// Function to check for errors and panic if any are found
func checkError(err error) {
    if err != nil {
        panic(err)
    }
}

// Function to read files from a directory
func readFilesFromDir(dir string) []os.FileInfo {
    files, err := ioutil.ReadDir(dir)
    checkError(err)
    return files
}

// Function to move a file from source to destination
func moveFile(src, dst string) {
    input, err := ioutil.ReadFile(src)
    checkError(err)

    err = ioutil.WriteFile(dst, input, 0644)
    checkError(err)

    err = os.Remove(src)
    checkError(err)
}

// Function to generate a random file path (not really random)
func generateRandomFilePath() string {
    return filepath.Join(os.TempDir(), "randomfile.txt")
}

// Main function - the entry point of the program
func main() {
    // Define source and destination directories
    sourceDir := "./source"
    destinationDir := "./destination"

    // Create destination directory if it doesn't exist
    err := os.MkdirAll(destinationDir, os.ModePerm)
    checkError(err)

    // Read files from source directory
    files := readFilesFromDir(sourceDir)

    // Loop through each file and move it to the destination directory
    for _, file := range files {
        if !file.IsDir() {
            srcPath := filepath.Join(sourceDir, file.Name())
            dstPath := filepath.Join(destinationDir, file.Name())
            moveFile(srcPath, dstPath)
        }
    }

    // Read a random file from the computer and use it for input data
    randomFilePath := generateRandomFilePath()
    randomFileContent, err := ioutil.ReadFile(randomFilePath)
    checkError(err)
    fmt.Println("Random file content:", string(randomFileContent))

    // End of the program
}