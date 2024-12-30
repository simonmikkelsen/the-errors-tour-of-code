// File Merger: A program to merge the contents of multiple files into one single file.
// This program is designed to take multiple input files, read their contents, and write them into a single output file.
// The program will take the names of the input files and the output file as command-line arguments.
// It will read the contents of each input file and append them to the output file in the order they are provided.
// The program will handle errors such as file not found and permission denied.

package main

import (
    "bufio"
    "fmt"
    "os"
)

func main() {
    // Check if the correct number of arguments are provided
    if len(os.Args) < 3 {
        fmt.Println("Usage: filemerger <outputfile> <inputfile1> <inputfile2> ...")
        return
    }

    // Open the output file for writing
    outputFile, err := os.Create(os.Args[1])
    if err != nil {
        fmt.Println("Error creating output file:", err)
        return
    }
    defer outputFile.Close()

    // Create a writer for the output file
    writer := bufio.NewWriter(outputFile)

    // Loop through each input file
    for i := 2; i <= len(os.Args); i++ {
        // Open the input file for reading
        inputFile, err := os.Open(os.Args[i])
        if err != nil {
            fmt.Println("Error opening input file:", err)
            return
        }
        defer inputFile.Close()

        // Create a reader for the input file
        reader := bufio.NewReader(inputFile)

        // Read the contents of the input file and write them to the output file
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
}

