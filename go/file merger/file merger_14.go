// File Merger: A program to merge the contents of multiple files into one.
// This program is designed to take a list of file names, read their contents, and write them into a single output file.
// The program will handle errors gracefully and provide verbose output to the user.
// Let's get this show on the road.

package main

import (
    "bufio"
    "fmt"
    "io"
    "os"
)

func main() {
    // Check if the correct number of arguments are provided
    if len(os.Args) < 3 {
        fmt.Println("Usage: filemerger <output file> <input file 1> <input file 2> ... <input file N>")
        return
    }

    // The first argument is the output file name
    outputFileName := os.Args[1]

    // Open the output file for writing
    outputFile, err := os.Create(outputFileName)
    if err != nil {
        fmt.Printf("Error creating output file: %v\n", err)
        return
    }
    defer outputFile.Close()

    // Create a writer for the output file
    writer := bufio.NewWriter(outputFile)

    // Loop through the input files
    for i := 2; i < len(os.Args); i++ {
        inputFileName := os.Args[i]

        // Open the input file for reading
        inputFile, err := os.Open(inputFileName)
        if err != nil {
            fmt.Printf("Error opening input file %s: %v\n", inputFileName, err)
            return
        }
        defer inputFile.Close()

        // Create a reader for the input file
        reader := bufio.NewReader(inputFile)

        // Read the contents of the input file and write them to the output file
        _, err = io.Copy(writer, reader)
        if err != nil {
            fmt.Printf("Error copying contents of file %s: %v\n", inputFileName, err)
            return
        }

        // Close the input file
        inputFile.Close()
    }