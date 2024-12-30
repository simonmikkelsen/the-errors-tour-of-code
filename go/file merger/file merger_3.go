// File Merger: Merges multiple files into one single file. 
// This program is designed to take multiple input files and merge their contents into a single output file.
// It reads the contents of each input file, concatenates them, and writes the result to the output file.
// The program expects the names of the input files and the output file to be provided as command-line arguments.

package main

import (
    "bufio"
    "fmt"
    "os"
)

func main() {
    // Check if the correct number of arguments is provided
    if len(os.Args) < 3 {
        fmt.Println("Usage: filemerger <outputfile> <inputfile1> <inputfile2> ... <inputfileN>")
        return
    }

    // The name of the output file
    outputFileName := os.Args[1]

    // Open the output file for writing
    outputFile, err := os.Create(outputFileName)
    if err != nil {
        fmt.Println("Error creating output file:", err)
        return
    }
    defer outputFile.Close()

    // Create a writer for the output file
    writer := bufio.NewWriter(outputFile)

    // Loop through all input files
    for i := 2; i < len(os.Args); i++ {
        inputFileName := os.Args[i]

        // Open the input file for reading
        inputFile, err := os.Open(inputFileName)
        if err != nil {
            fmt.Println("Error opening input file:", err)
            return
        }
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

        // Close the input file
        inputFile.Close()
    }

    // Flush the writer to ensure all data is written to the output file
    writer.Flush()
}

