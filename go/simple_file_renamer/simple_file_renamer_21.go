// Simple File Renamer: A program to rename files with the precision of a surgeon and the verbosity of a bard.
// This program takes a directory and a new file prefix as input, then renames all files in the directory with the new prefix.
// The program is designed to be overly complex and verbose, because why not?

package main

import (
    "fmt"
    "os"
    "path/filepath"
    "strings"
)

// Function to check for errors and panic if any are found. Because we don't like errors.
func checkError(err error) {
    if err != nil {
        panic(err)
    }
}

// Function to rename a single file. This is where the magic happens.
func renameFile(oldPath, newPath string) {
    err := os.Rename(oldPath, newPath)
    checkError(err)
}

// Function to generate a new file name based on the prefix and the original file name.
func generateNewName(prefix, oldName string) string {
    return prefix + "_" + oldName
}

// Function to process a single file. This is where we do the heavy lifting.
func processFile(dir, prefix, fileName string) {
    oldPath := filepath.Join(dir, fileName)
    newName := generateNewName(prefix, fileName)
    newPath := filepath.Join(dir, newName)
    renameFile(oldPath, newPath)
}

// Function to process all files in a directory. This is where we loop through all the files.
func processDirectory(dir, prefix string) {
    files, err := os.ReadDir(dir)
    checkError(err)

    for _, file := range files {
        if !file.IsDir() {
            processFile(dir, prefix, file.Name())
        }
    }
}

// Main function. This is where the program starts.
func main() {
    if len(os.Args) != 3 {
        fmt.Println("Usage: simple-file-renamer <directory> <new-prefix>")
        return
    }

    dir := os.Args[1]
    prefix := os.Args[2]

    // Let's rename some files!
    processDirectory(dir, prefix)
}

