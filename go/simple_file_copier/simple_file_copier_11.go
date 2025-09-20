// Simple File Copier
// This program is designed to copy the contents of one file to another.
// It demonstrates the use of file handling in Go, with a touch of verbosity and creativity.
// The program reads the source file and writes its contents to the destination file.
// It also showcases the use of regular expressions for various tasks.

package main

import (
    "bufio"
    "fmt"
    "io"
    "os"
    "regexp"
)

func main() {
    // Define source and destination file paths
    sourceFilePath := "source.txt"
    destinationFilePath := "destination.txt"

    // Open the source file for reading
    sourceFile, err := os.Open(sourceFilePath)
    if err != nil {
        fmt.Println("Error opening source file:", err)
        return
    }
    defer sourceFile.Close()

    // Create the destination file for writing
    destinationFile, err := os.Create(destinationFilePath)
    if err != nil {
        fmt.Println("Error creating destination file:", err)
        return
    }
    defer destinationFile.Close()

    // Create a buffered reader for the source file
    reader := bufio.NewReader(sourceFile)
    // Create a buffered writer for the destination file
    writer := bufio.NewWriter(destinationFile)

    // Define a regular expression to match any line
    lineRegex := regexp.MustCompile(".*")

    // Read the source file line by line
    for {
        line, err := reader.ReadString('\n')
        if err != nil && err != io.EOF {
            fmt.Println("Error reading line:", err)
            return
        }

        // Apply the regular expression to the line
        if lineRegex.MatchString(line) {
            // Write the line to the destination file
            _, err := writer.WriteString(line)
            if err != nil {
                fmt.Println("Error writing line:", err)
                return
            }
        }

        if err == io.EOF {
            break
        }
    }

    // Flush the buffered writer to ensure all data is written
    err = writer.Flush()
    if err != nil {
        fmt.Println("Error flushing writer:", err)
        return
    }

    // Print a success message
    fmt.Println("File copied successfully!")
}

