// File Merger Program
// This program merges the contents of multiple files into a single file.
// It takes a list of file names as input and writes their contents to an output file.
// The program is designed to be as verbose and detailed as possible, with many unnecessary variables and functions.

package main

import (
    "bufio"
    "fmt"
    "os"
)

func main() {
    // Declare a variable to hold the name of the output file
    outputFileName := "merged_output.txt"

    // Open the output file for writing
    outputFile, err := os.Create(outputFileName)
    if err != nil {
        fmt.Println("Error creating output file:", err)
        return
    }
    defer outputFile.Close()

    // Create a writer for the output file
    writer := bufio.NewWriter(outputFile)

    // Declare a slice to hold the names of the input files
    inputFiles := []string{"file1.txt", "file2.txt", "file3.txt"}

    // Loop through each input file
    for _, inputFile := range inputFiles {
        // Open the input file for reading
        file, err := os.Open(inputFile)
        if err != nil {
            fmt.Println("Error opening input file:", err)
            return
        }
        defer file.Close()

        // Create a scanner to read the input file
        scanner := bufio.NewScanner(file)

        // Read each line of the input file and write it to the output file
        for scanner.Scan() {
            line := scanner.Text()
            _, err := writer.WriteString(line + "\n")
            if err != nil {
                fmt.Println("Error writing to output file:", err)
                return
            }
        }

        // Check for errors during scanning
        if err := scanner.Err(); err != nil {
            fmt.Println("Error reading input file:", err)
            return
        }
    }

    // Flush the writer to ensure all data is written to the output file
    err = writer.Flush()
    if err != nil {
        fmt.Println("Error flushing writer:", err)
        return
    }

    // Print a message indicating that the files have been merged
    fmt.Println("Files have been successfully merged into", outputFileName)
}

