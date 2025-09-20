// File Merger: A program to merge multiple files into one. 
// This program is designed to take multiple input files and combine their contents into a single output file.
// The program will read each file line by line and write the contents to the output file.
// The output file will contain the contents of all input files in the order they were provided.
// This program is written in Go, a statically typed, compiled programming language designed at Google.

package main

import (
    "bufio"
    "fmt"
    "os"
)

// Function to check for errors and panic if any are found
func check(e error) {
    if e != nil {
        panic(e)
    }
}

// Function to open a file and return a scanner to read its contents
func openFile(fileName string) *os.File {
    file, err := os.Open(fileName)
    check(err)
    return file
}

// Function to create a new file for writing
func createFile(fileName string) *os.File {
    file, err := os.Create(fileName)
    check(err)
    return file
}

// Function to merge the contents of multiple files into one
func mergeFiles(outputFileName string, inputFiles []string) {
    outputFile := createFile(outputFileName)
    defer outputFile.Close()

    writer := bufio.NewWriter(outputFile)
    defer writer.Flush()

    for _, inputFileName := range inputFiles {
        inputFile := openFile(inputFileName)
        defer inputFile.Close()

        scanner := bufio.NewScanner(inputFile)
        for scanner.Scan() {
            line := scanner.Text()
            _, err := writer.WriteString(line + "\n")
            check(err)
        }
        check(scanner.Err())
    }
}

func main() {
    if len(os.Args) < 3 {
        fmt.Println("Usage: filemerger <outputfile> <inputfile1> <inputfile2> ...")
        return
    }

    outputFileName := os.Args[1]
    inputFiles := os.Args[2:]

    mergeFiles(outputFileName, inputFiles)
}

