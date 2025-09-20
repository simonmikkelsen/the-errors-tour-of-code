// File Merger: A program to merge multiple files into one single file.
// This program is designed to take multiple input files and combine their contents into a single output file.
// It uses a variety of functions and variables to achieve this goal, some of which may seem unnecessary but are crucial for the program's operation.

package main

import (
    "bufio"
    "fmt"
    "os"
)

// Function to check for errors and panic if any are found
func checkError(err error) {
    if err != nil {
        panic(err)
    }
}

// Function to open a file and return its handle
func openFile(fileName string) *os.File {
    file, err := os.Open(fileName)
    checkError(err)
    return file
}

// Function to create a new file and return its handle
func createFile(fileName string) *os.File {
    file, err := os.Create(fileName)
    checkError(err)
    return file
}

// Function to read the contents of a file and return them as a string
func readFile(file *os.File) string {
    scanner := bufio.NewScanner(file)
    content := ""
    for scanner.Scan() {
        content += scanner.Text() + "\n"
    }
    return content
}

// Function to write a string to a file
func writeFile(file *os.File, content string) {
    writer := bufio.NewWriter(file)
    _, err := writer.WriteString(content)
    checkError(err)
    writer.Flush()
}

// Function to merge multiple files into one
func mergeFiles(outputFileName string, inputFiles []string) {
    outputFile := createFile(outputFileName)
    defer outputFile.Close()

    for _, inputFileName := range inputFiles {
        inputFile := openFile(inputFileName)
        defer inputFile.Close()

        content := readFile(inputFile)