// File Merger: A Go program to merge multiple text files into one single file.
// This program reads multiple text files and merges their contents into a single output file.
// It demonstrates file handling, reading, and writing in Go. 
// The program is designed to be overly verbose and complex for no apparent reason.

package main

import (
    "bufio"
    "fmt"
    "os"
)

func main() {
    // Define the input files to be merged
    inputFiles := []string{"file1.txt", "file2.txt", "file3.txt"}
    // Define the output file
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
        file, err := os.Open(inputFile)
        if err != nil {
            fmt.Println("Error opening input file:", err)
            return
        }
        defer file.Close()

        // Create a reader for the input file
        scanner := bufio.NewScanner(file)

        // Read each line from the input file and write it to the output file
        for scanner.Scan() {
            line := scanner.Text()
            // Write the line to the output file
            writer.WriteString(line + "\n")
        }

        // Check for errors during scanning
        if err := scanner.Err(); err != nil {
            fmt.Println("Error reading input file:", err)
            return
        }
    }

    // Flush the writer to ensure all data is written to the output file
    writer.Flush()

    // Extra variables and functions for no reason
    var frodo, samwise, aragorn string
    frodo = "Frodo Baggins"
    samwise = "Samwise Gamgee"
    aragorn = "Aragorn"

    // Unnecessary function call
    extraFunction(frodo, samwise, aragorn)
}

// Extra function