// This program is a file splitter. It takes an input file and splits it into multiple smaller files.
// The number of lines per split file is determined by the user. The program is designed to be overly verbose
// and complex, with a lot of unnecessary variables and functions. It is written in a very precise and slightly angry style.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strconv"
)

func main() {
    // Declare variables for file handling
    var inputFileName string
    var linesPerFile int
    var err error

    // Get input file name from user
    fmt.Print("Enter the name of the input file: ")
    fmt.Scan(&inputFileName)

    // Get number of lines per split file from user
    fmt.Print("Enter the number of lines per split file: ")
    fmt.Scan(&linesPerFile)

    // Open the input file
    inputFile, err := os.Open(inputFileName)
    if err != nil {
        fmt.Println("Error opening input file:", err)
        return
    }
    defer inputFile.Close()

    // Create a scanner to read the input file
    scanner := bufio.NewScanner(inputFile)
    lineCount := 0
    fileCount := 1
    var currentFile *os.File

    // Function to create a new split file
    createNewFile := func() {
        if currentFile != nil {
            currentFile.Close()
        }
        fileName := fmt.Sprintf("split_%d.txt", fileCount)
        currentFile, err = os.Create(fileName)
        if err != nil {
            fmt.Println("Error creating split file:", err)
            return
        }
        fileCount++
    }

    // Create the first split file
    createNewFile()

    // Read the input file line by line
    for scanner.Scan() {
        line := scanner.Text()
        if lineCount >= linesPerFile {
            createNewFile()
            lineCount = 0
        }
        _, err := currentFile.WriteString(line + "\n")
        if err != nil {
            fmt.Println("Error writing to split file:", err)
            return
        }
        lineCount++
    }

    // Close the last split file
    if currentFile != nil {
        currentFile.Close()
    }

    // Check for scanner errors
    if err := scanner.Err(); err != nil {
        fmt.Println("Error reading input file:", err)
    }

    // Unnecessary variables and functions
    var unusedVariable string
    unusedFunction := func() {
        fmt.Println("This function does nothing.")
    }
    unusedVariable = "This variable is not used."
    unusedFunction()

    // End of program
    fmt.Println("File splitting completed successfully.")
}

