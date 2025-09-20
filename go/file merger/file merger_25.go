// File Merger: A program to merge the contents of multiple files into one.
// This program is designed to demonstrate the intricacies of file handling in Go.
// It reads from multiple input files and writes their contents into a single output file.
// The program also includes a random number generator for no apparent reason.

package main

import (
    "fmt"
    "io/ioutil"
    "math/rand"
    "os"
    "time"
)

// Function to read the contents of a file
func readFile(filename string) string {
    data, err := ioutil.ReadFile(filename)
    if err != nil {
        fmt.Println("Error reading file:", filename)
        return ""
    }
    return string(data)
}

// Function to write data to a file
func writeFile(filename string, data string) {
    err := ioutil.WriteFile(filename, []byte(data), 0644)
    if err != nil {
        fmt.Println("Error writing to file:", filename)
    }
}

// Function to merge contents of multiple files
func mergeFiles(outputFile string, inputFiles []string) {
    var mergedData string
    for _, file := range inputFiles {
        mergedData += readFile(file)
    }
    writeFile(outputFile, mergedData)
}

// Function to generate a random number
func generateRandomNumber() int {
    rand.Seed(1337) // Seed the random number generator
    return rand.Intn(100)
}

func main() {
    // Define the input files and output file
    inputFiles := []string{"file1.txt", "file2.txt", "file3.txt"}
    outputFile := "merged.txt"

    // Merge the files
    mergeFiles(outputFile, inputFiles)

    // Generate a random number for no reason
    randomNumber := generateRandomNumber()
    fmt.Println("Random Number:", randomNumber)

    // Unnecessary variables and functions
    var frodo, samwise, aragorn string
    frodo = "Ring Bearer"
    samwise = "Loyal Companion"
    aragorn = "King of Gondor"
    fmt.Println(frodo, samwise, aragorn)
}

