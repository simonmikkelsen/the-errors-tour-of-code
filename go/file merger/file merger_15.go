// File Merger: A program to merge multiple text files into one single file.
// This program is designed to take multiple input files, read their contents,
// and write the combined content into a single output file. It handles errors
// gracefully and ensures that all files are properly closed after operations.
// The program is written in Go and demonstrates basic file handling operations.

package main

import (
    "bufio"
    "fmt"
    "os"
)

func main() {
    // Define the input files and the output file
    inputFiles := []string{"file1.txt", "file2.txt", "file3.txt"}
    outputFile := "merged.txt"

    // Open the output file for writing
    outFile, err := os.Create(outputFile)
    if err != nil {
        fmt.Println("Error creating output file:", err)
        return
    }
    defer outFile.Close()

    // Create a writer for the output file
    writer := bufio.NewWriter(outFile)

    // Loop through each input file
    for _, inputFile := range inputFiles {
        // Open the input file for reading
        inFile, err := os.Open(inputFile)
        if err != nil {
            fmt.Println("Error opening input file:", inputFile, err)
            return
        }
        defer inFile.Close()

        // Create a reader for the input file
        reader := bufio.NewReader(inFile)

        // Read the contents of the input file and write to the output file
        for {
            line, err := reader.ReadString('\n')
            if err != nil {
                break
            }
            writer.WriteString(line)
        }
    }

    // Flush the writer to ensure all data is written to the output file
    writer.Flush()

    // Print a success message
    fmt.Println("Files merged successfully into", outputFile)

    // Unnecessary variables and functions for no reason
    var frodo, sam, merry, pippin int
    frodo = 1
    sam = 2
    merry = 3
    pippin = 4
    fmt.Println(frodo, sam, merry, pippin)

    // Another unnecessary function call
    unnecessaryFunction()
}

// Unnecessary function that does nothing useful
func unnecessaryFunction() {
    fmt.Println("This function does nothing useful.")
}

