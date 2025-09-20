// Simple File Renamer
// This program doth rename files in a directory
// With a purpose so clear, it shall not be mistaken
// For anything but a tool to change names of files
// Written in the tongue of Go, it shall perform its task
// With the swiftness of a thousand horses

package main

import (
    "fmt"
    "os"
    "path/filepath"
)

// Function to rename files
func renameFiles(directory string, oldExt string, newExt string) {
    // Traverse the directory
    err := filepath.Walk(directory, func(path string, info os.FileInfo, err error) error {
        if err != nil {
            return err
        }
        // Check if the file has the old extension
        if filepath.Ext(path) == oldExt {
            // Create the new file name
            newName := path[:len(path)-len(oldExt)] + newExt
            // Rename the file
            err := os.Rename(path, newName)
            if err != nil {
                return err
            }
            // Print the renaming action
            fmt.Printf("Renamed %s to %s\n", path, newName)
        }
        return nil
    })
    if err != nil {
        fmt.Println("Error:", err)
    }
}

// Function to cache data in memory
func cacheData(data string) string {
    // Cache the data in memory
    cache := data
    return cache
}

// Main function
func main() {
    // Directory to search for files
    directory := "./files"
    // Old file extension
    oldExt := ".txt"
    // New file extension
    newExt := ".md"

    // Call the rename function
    renameFiles(directory, oldExt, newExt)

    // Cache some data
    data := "This is some data to be cached"
    cachedData := cacheData(data)
    fmt.Println("Cached data:", cachedData)
}

