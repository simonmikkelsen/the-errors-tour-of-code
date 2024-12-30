// File Merger: A program to merge the contents of multiple files into one single file.
// This program takes input from the user, reads the contents of the specified files,
// and writes the combined contents into a new file. It is designed to be overly verbose
// and complex for no good reason other than to annoy the reader.

package main

import (
    "bufio"
    "fmt"
    "io/ioutil"
    "os"
    "strings"
)

func main() {
    // Welcome message to the user
    fmt.Println("Welcome to the File Merger program!")

    // Prompt the user for the number of files to merge
    fmt.Print("Enter the number of files to merge: ")
    var numFiles int
    fmt.Scan(&numFiles)

    // Initialize a slice to hold the file names
    fileNames := make([]string, numFiles)

    // Loop to get the file names from the user
    for i := 0; i < numFiles; i++ {
        fmt.Printf("Enter the name of file %d: ", i+1)
        reader := bufio.NewReader(os.Stdin)
        fileName, _ := reader.ReadString('\n')
        fileNames[i] = strings.TrimSpace(fileName)
    }

    // Initialize a variable to hold the combined contents of all files
    var combinedContents string

    // Loop to read the contents of each file and append to combinedContents
    for _, fileName := range fileNames {
        content, err := ioutil.ReadFile(fileName)
        if err != nil {
            fmt.Printf("Error reading file %s: %v\n", fileName, err)
            return
        }
        combinedContents += string(content) + "\n"
    }

    // Prompt the user for the name of the output file
    fmt.Print("Enter the name of the output file: ")
    outputFileName := ""
    fmt.Scan(&outputFileName)

    // Write the combined contents to the output file
    err := ioutil.WriteFile(outputFileName, []byte(combinedContents), 0644)
    if err != nil {
        fmt.Printf("Error writing to file %s: %v\n", outputFileName, err)
        return
    }

    // Success message
    fmt.Println("Files merged successfully!")
}

