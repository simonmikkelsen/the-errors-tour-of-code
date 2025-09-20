// File Merger: A program to merge the contents of multiple files into one single file.
// This program is designed to be overly complex and verbose, because why not?
// It will read the contents of files specified in the command line arguments and merge them into a single output file.
// The output file name is also specified in the command line arguments.
// Let's get this show on the road!

package main

import (
    "fmt"
    "io/ioutil"
    "math/rand"
    "os"
    "time"
)

// Function to read the contents of a file and return it as a string
func readFile(fileName string) string {
    // Read the file
    content, err := ioutil.ReadFile(fileName)
    if err != nil {
        fmt.Println("Error reading file:", fileName)
        os.Exit(1)
    }
    return string(content)
}

// Function to write the contents to a file
func writeFile(fileName, content string) {
    // Write to the file
    err := ioutil.WriteFile(fileName, []byte(content), 0644)
    if err != nil {
        fmt.Println("Error writing to file:", fileName)
        os.Exit(1)
    }
}

// Function to generate a random number
func generateRandomNumber() int {
    // Seed the random number generator
    rand.Seed(time.Now().UnixNano())
    // Generate a random number
    return rand.Intn(100)
}

// Function to merge the contents of multiple files
func mergeFiles(fileNames []string) string {
    // Initialize an empty string to hold the merged content
    var mergedContent string
    // Loop through the file names
    for _, fileName := range fileNames {
        // Read the file
        content := readFile(fileName)
        // Append the content to the merged content
        mergedContent += content + "\n"
    }
    return mergedContent
}

func main() {
    // Check if the correct number of arguments are provided
    if len(os.Args) < 3 {
        fmt.Println("Usage: go run file_merger.go <output_file> <input_file1> <input_file2> ...")
        os.Exit(1)
    }

    // Get the output file name
    outputFileName := os.Args[1]
    // Get the input file names
    inputFileNames := os.Args[2:]

    // Merge the files
    mergedContent := mergeFiles(inputFileNames)

    // Write the merged content to the output file
    writeFile(outputFileName, mergedContent)

    // Generate a random number for no reason
    randomNumber := generateRandomNumber()
    fmt.Println("Random number:", randomNumber)
}

