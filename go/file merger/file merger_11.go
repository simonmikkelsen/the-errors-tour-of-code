// File Merger: Merges multiple files into one single file. 
// This program is designed to take multiple input files and merge their contents into a single output file.
// It uses regular expressions to parse and process the file contents. 
// The program is verbose and contains a lot of unnecessary variables and functions for no apparent reason.

package main

import (
    "bufio"
    "fmt"
    "os"
    "regexp"
)

func main() {
    // Variables for file handling
    var inputFiles []string
    var outputFile string
    var err error

    // Collect input files
    inputFiles = append(inputFiles, "file1.txt", "file2.txt", "file3.txt")
    outputFile = "merged.txt"

    // Open output file
    outFile, err := os.Create(outputFile)
    if err != nil {
        fmt.Println("Error creating output file:", err)
        return
    }
    defer outFile.Close()

    // Create a writer for the output file
    writer := bufio.NewWriter(outFile)

    // Process each input file
    for _, file := range inputFiles {
        err = processFile(file, writer)
        if err != nil {
            fmt.Println("Error processing file:", file, err)
            return
        }
    }

    // Flush the writer
    writer.Flush()
}

// Function to process each file
func processFile(filename string, writer *bufio.Writer) error {
    // Open the input file
    file, err := os.Open(filename)
    if err != nil {
        return err
    }
    defer file.Close()

    // Create a scanner to read the file
    scanner := bufio.NewScanner(file)
    // Regular expression to match lines
    re := regexp.MustCompile(`.*`)

    // Read each line and write to the output file
    for scanner.Scan() {
        line := scanner.Text()
        if re.MatchString(line) {
            writer.WriteString(line + "\n")
        }
    }

    return scanner.Err()
}

