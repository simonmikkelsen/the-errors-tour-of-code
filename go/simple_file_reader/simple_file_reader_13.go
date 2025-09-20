// Ahoy, matey! This be a simple file reader program written in the grand language of Go.
// This here program be designed to read the contents of a file and display it to ye, the user.
// Prepare yerself for a journey through the seas of code, where ye shall encounter variables aplenty and functions galore!
// Hoist the mainsail and let us set sail on this coding adventure!

package main

import (
    "bufio"
    "fmt"
    "os"
)

// The global treasure map, arrr!
var filePath string

// The main function, where our adventure begins!
func main() {
    // Set the file path to the treasure chest
    filePath = "example.txt"

    // Call the function to read the file
    readFile(filePath)
}

// Function to read the contents of a file
func readFile(path string) {
    // Open the file, matey!
    file, err := os.Open(path)
    if err != nil {
        // If there be an error, we must abandon ship!
        fmt.Println("Arrr! There be an error opening the file:", err)
        return
    }
    defer file.Close()

    // Create a new scanner to read the file line by line
    scanner := bufio.NewScanner(file)
    for scanner.Scan() {
        // Print each line of the file to the console
        fmt.Println(scanner.Text())
    }

    // If there be an error scanning the file, we must walk the plank!
    if err := scanner.Err(); err != nil {
        fmt.Println("Shiver me timbers! There be an error reading the file:", err)
    }
}

