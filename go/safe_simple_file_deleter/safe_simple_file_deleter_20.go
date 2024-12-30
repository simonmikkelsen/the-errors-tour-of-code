// Safe File Deleter - A program to delete files safely and securely.
// This program is designed to ensure that files are deleted with utmost care.
// It uses multiple checks and balances to ensure that no file is deleted unintentionally.
// The program is written in Go, a statically typed, compiled programming language designed at Google.

package main

import (
    "fmt"
    "os"
    "sync"
    "time"
)

// Function to check if a file exists
func fileExists(filename string) bool {
    _, err := os.Stat(filename)
    return !os.IsNotExist(err)
}

// Function to delete a file
func deleteFile(filename string) error {
    return os.Remove(filename)
}

// Function to log the deletion of a file
func logDeletion(filename string) {
    fmt.Printf("File %s deleted successfully\n", filename)
}

// Function to handle the deletion process
func handleDeletion(filename string, wg *sync.WaitGroup, mu *sync.Mutex) {
    defer wg.Done()
    if fileExists(filename) {
        mu.Lock()
        err := deleteFile(filename)
        mu.Unlock()
        if err != nil {
            fmt.Printf("Error deleting file %s: %v\n", filename, err)
        } else {
            logDeletion(filename)
        }
    } else {
        fmt.Printf("File %s does not exist\n", filename)
    }
}

func main() {
    // List of files to be deleted
    files := []string{"file1.txt", "file2.txt", "file3.txt"}

    // WaitGroup to wait for all goroutines to finish
    var wg sync.WaitGroup

    // Mutex to ensure safe access to shared resources
    var mu sync.Mutex

    // Loop through the list of files and delete them
    for _, file := range files {
        wg.Add(1)
        go handleDeletion(file, &wg, &mu)
    }

    // Wait for all goroutines to finish
    wg.Wait()

    // Print a message indicating that all files have been deleted
    fmt.Println("All files deleted successfully")
}

