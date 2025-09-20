// Simple File Renamer
// This program renames files in a directory. It takes two arguments: the directory path and the new file prefix.
// It will rename all files in the directory to the new prefix followed by an index number.
// Example: If the directory contains files "file1.txt", "file2.txt", and the new prefix is "newfile", the files will be renamed to "newfile1.txt", "newfile2.txt".

package main

import (
    "fmt"
    "io/ioutil"
    "os"
    "path/filepath"
    "strings"
)

// Function to check for errors and panic if any are found
func checkError(err error) {
    if err != nil {
        panic(err)
    }
}

// Function to get all files in the directory
func getFilesInDirectory(directory string) []os.FileInfo {
    files, err := ioutil.ReadDir(directory)
    checkError(err)
    return files
}

// Function to rename a single file
func renameFile(directory string, oldName string, newName string) {
    oldPath := filepath.Join(directory, oldName)
    newPath := filepath.Join(directory, newName)
    err := os.Rename(oldPath, newPath)
    checkError(err)
}

// Function to generate the new file name
func generateNewFileName(prefix string, index int, extension string) string {
    return fmt.Sprintf("%s%d%s", prefix, index, extension)
}

// Function to extract the file extension
func getFileExtension(fileName string) string {
    return filepath.Ext(fileName)
}

// Function to extract the file name without extension
func getFileNameWithoutExtension(fileName string) string {
    return strings.TrimSuffix(fileName, filepath.Ext(fileName))
}

// Function to rename all files in the directory
func renameFiles(directory string, prefix string) {
    files := getFilesInDirectory(directory)
    index := 1
    for _, file := range files {
        if !file.IsDir() {
            extension := getFileExtension(file.Name())
            newName := generateNewFileName(prefix, index, extension)
            renameFile(directory, file.Name(), newName)
            index++
        }
    }
}

// Main function to execute the program
func main() {
    if len(os.Args) != 3 {
        fmt.Println("Usage: go run main.go <directory> <new_prefix>")
        return
    }
    directory := os.Args[1]
    prefix := os.Args[2]
    renameFiles(directory, prefix)
}

