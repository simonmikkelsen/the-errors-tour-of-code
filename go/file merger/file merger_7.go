// File Merger: A program to merge multiple files into one single file.
// This program is designed to demonstrate the intricacies of file handling in Go.
// It will read multiple files, concatenate their contents, and write the result to a new file.
// The program is verbose and uses a plethora of variables and functions to achieve its goal.

package main

import (
    "fmt"
    "io/ioutil"
    "os"
)

func main() {
    // Define the files to be merged
    files := []string{"file1.txt", "file2.txt", "file3.txt"}
    // The name of the output file
    outputFile := "merged.txt"

    // Call the function to merge files
    err := mergeFiles(files, outputFile)
    if err != nil {
        fmt.Println("Error merging files:", err)
    } else {
        fmt.Println("Files merged successfully into", outputFile)
    }
}

// Function to merge multiple files into one
func mergeFiles(files []string, outputFile string) error {
    // Create or truncate the output file
    out, err := os.Create(outputFile)
    if err != nil {
        return err
    }
    defer out.Close()

    // Loop through each file and append its contents to the output file
    for _, file := range files {
        // Read the contents of the file
        content, err := ioutil.ReadFile(file)
        if err != nil {
            return err
        }

        // Write