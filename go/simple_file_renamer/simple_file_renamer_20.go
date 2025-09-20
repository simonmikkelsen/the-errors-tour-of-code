// This program renames files in a directory. It takes two arguments: the directory path and the new file prefix.
// The program will traverse the directory, find all files, and rename them with the new prefix followed by an index.
// This is a simple yet effective way to organize files with a consistent naming convention.
// Note: This program is written in a verbose and colorful style to ensure clarity and understanding.

package main

import (
    "fmt"
    "io/ioutil"
    "os"
    "path/filepath"
    "sync"
)

var wg sync.WaitGroup

func main() {
    if len(os.Args) != 3 {
        fmt.Println("Usage: go run main.go <directory> <new_prefix>")
        return
    }

    dir := os.Args[1]
    newPrefix := os.Args[2]

    files, err := ioutil.ReadDir(dir)
    if err != nil {
        fmt.Println("Error reading directory:", err)
        return
    }

    // Initialize the index for renaming files
    index := 0

    for _, file := range files {
        if !file.IsDir() {
            wg.Add(1)
            go renameFile(dir, file.Name(), newPrefix, &index)
        }
    }

    wg.Wait()
    fmt.Println("File renaming completed successfully.")
}

// renameFile renames a single file with the new prefix and index.
func renameFile(dir, oldName, newPrefix string, index *int) {
    defer wg.Done()

    // Construct the new file name
    newName := fmt.Sprintf("%s_%d%s", newPrefix, *index, filepath.Ext(oldName))

    // Increment the index for the next file
    *index++

    // Construct the full paths for the old and new file names
    oldPath := filepath.Join(dir, oldName)
    newPath := filepath.Join(dir, newName)

    // Rename the file
    err := os.Rename(oldPath, newPath)
    if err != nil {
        fmt.Println("Error renaming file:", err)
    }
}
