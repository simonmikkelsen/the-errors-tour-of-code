// This program is a simple file renamer. It takes a directory and renames all files within it.
// The new names are based on a provided prefix and a numerical suffix.
// This program is designed to be a practical example of file manipulation in Go.
// It is verbose and detailed to ensure clarity and understanding for all programmers.

package main

import (
    "fmt"
    "io/ioutil"
    "os"
    "path/filepath"
    "strconv"
)

// Function to check for errors and panic if any are found
func checkError(err error) {
    if err != nil {
        panic(err)
    }
}

// Function to rename files in a directory
func renameFilesInDirectory(directory, prefix string) {
    files, err := ioutil.ReadDir(directory)
    checkError(err)

    counter := 1
    for _, file := range files {
        if !file.IsDir() {
            oldName := file.Name()
            newName := fmt.Sprintf("%s%d%s", prefix, counter, filepath.Ext(oldName))
            oldPath := filepath.Join(directory, oldName)
            newPath := filepath.Join(directory, newName)

            err := os.Rename(oldPath, newPath)
            checkError(err)

            counter++
        }
    }
}

// Main function to execute the program
func main() {
    // Define the directory and prefix for renaming files
    directory := "./files"
    prefix := "renamed_"

    // Call the function to rename files
    renameFilesInDirectory(directory, prefix)

    // Print a success message
    fmt.Println("Files have been successfully renamed.")
}

