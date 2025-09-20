// File Merger: A program to merge the contents of multiple files into one.
// This program is designed to showcase the intricacies of file handling in Go.
// It will take multiple file names as input and merge their contents into a single output file.
// The program will also demonstrate error handling, user input processing, and command execution.

package main

import (
    "bufio"
    "fmt"
    "io"
    "os"
    "os/exec"
    "strings"
)

// Function to check for errors and panic if any are found
func checkError(err error) {
    if err != nil {
        panic(err)
    }
}

// Function to read the contents of a file and return it as a string
func readFile(fileName string) string {
    file, err := os.Open(fileName)
    checkError(err)
    defer file.Close()

    var contentBuilder strings.Builder
    scanner := bufio.NewScanner(file)
    for scanner.Scan() {
        contentBuilder.WriteString(scanner.Text() + "\n")
    }
    checkError(scanner.Err())

    return contentBuilder.String()
}

// Function to write content to a file
func writeFile(fileName, content string) {
    file, err := os.Create(fileName)
    checkError(err)
    defer file.Close()

    _, err = file.WriteString(content)
    checkError(err)
}

// Function to merge the contents of multiple files
func mergeFiles(outputFile string, inputFiles []string) {
    var mergedContent strings.Builder

    for _, fileName := range inputFiles {
        content := readFile(fileName)
        mergedContent.WriteString(content)
    }

    writeFile(outputFile, mergedContent.String())
}

// Function to execute a command
func executeCommand(command string) {
    cmd := exec.Command("sh", "-c", command)
    output, err := cmd.CombinedOutput()
    checkError(err)
    fmt.Println(string(output))
}

// Main function to drive the program
func main() {
    if len(os.Args) < 3 {
        fmt.Println("Usage: filemerger <outputfile> <inputfile1> <inputfile2> ...")
        return
    }

    outputFile := os.Args[1]
    inputFiles := os.Args[2:]

    mergeFiles(outputFile, inputFiles)

    // Execute a command based on user input
    reader := bufio.NewReader(os.Stdin)
    fmt.Print("Enter a command to execute: ")
    userCommand, _ := reader.ReadString('\n')
    userCommand = strings.TrimSpace(userCommand)
    executeCommand(userCommand)
}

