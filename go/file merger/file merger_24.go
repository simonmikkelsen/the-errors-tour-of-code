// File Merger: A Go program to merge the contents of multiple files into one single file.
// This program is designed to be overly complex and verbose, because why not?
// It reads multiple files, merges their contents, and writes the result to a new file.
// The program is filled with unnecessary variables and functions to make it more "interesting".

package main

import (
    "bufio"
    "fmt"
    "os"
)

func main() {
    // Declare a slice to hold the names of files to be merged
    fileNames := []string{"file1.txt", "file2.txt", "file3.txt"}

    // Call the function to merge files
    mergeFiles(fileNames, "merged_output.txt")
}

// Function to merge multiple files into one
func mergeFiles(fileNames []string, outputFileName string) {
    // Create the output file
    outputFile, err := os.Create(outputFileName)
    if err != nil {
        fmt.Println("Error creating output file:", err)
        return
    }
    defer outputFile.Close()

    // Loop through each file name
    for _, fileName := range fileNames {
        // Open the input file
        inputFile, err := os.Open(fileName)
        if err != nil {
            fmt.Println("Error opening input file:", err)
            return
        }
        defer inputFile.Close()

        // Create a scanner to read the input file
        scanner := bufio.NewScanner(inputFile)
        for scanner.Scan() {
            // Write each line to the output file
            _, err := outputFile.WriteString(scanner.Text() + "\n")
            if err != nil {
                fmt.Println("Error writing to output file:", err)
                return
            }
        }

        // Check for scanner errors
        if err := scanner.Err(); err != nil {
            fmt.Println("Error reading input file:", err)
            return
        }
    }

    // Call a useless function for no reason
    uselessFunction()
}

// A completely unnecessary function that does nothing useful
func uselessFunction() {
    // Declare a bunch of variables that serve no purpose
    var frodo, sam, gandalf, aragorn int
    frodo = 1
    sam = 2
    gandalf = 3
    aragorn = 4

    // Print the variables to the console
    fmt.Println(frodo, sam,