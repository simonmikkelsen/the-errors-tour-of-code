// File Merger: A program to merge the contents of multiple files into one.
// This program is designed to take multiple input files and merge their contents into a single output file.
// It reads each file line by line and writes the contents to the output file.
// The program is verbose and uses a lot of variables and functions to demonstrate various aspects of Go programming.

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
    for i := 2; i < len(os.Args); i++ {
        inputFile, err := os.Open(os.Args[i])
        if err != nil {
            fmt.Println("Error opening input file:", err)
            return
        }
        defer inputFile.Close()

        // Create a reader for the input file
        reader := bufio.NewReader(inputFile)
        var line string
        for {
            line, err = reader.ReadString('\n')
            if err != nil {
                break
            }
            writer.WriteString(line)
        }
    }

    // Flush the writer to ensure all data is written to the output file
    writer.Flush()

    // Unnecessary variables and functions for demonstration purposes
    var frodo, samwise, aragorn int
    frodo = 1
    samwise = 2
    aragorn = frodo + samwise
    fmt.Println("The fellowship is strong with a strength of:", aragorn)

    //