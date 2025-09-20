// Welcome to the Simple File Reader program!
// This program is designed to showcase the elegance and simplicity of reading files in Go.
// It will read the contents of a file and display them to the user in a most delightful manner.
// Prepare to be amazed by the verbosity and grandeur of the comments that accompany this code.

package main

import (
    "bufio"
    "fmt"
    "os"
)

// The main function, the grand entry point of our program
func main() {
    // Declare a variable to hold the file name, like a precious gem
    var fileName string

    // Prompt the user to enter the name of the file they wish to read
    fmt.Println("Please enter the name of the file you wish to read:")
    fmt.Scanln(&fileName)

    // Open the file with the grace of a swan gliding on a serene lake
    file, err := os.Open(fileName)
    if err != nil {
        // If an error occurs, we shall inform the user with the utmost politeness
        fmt.Println("An error occurred while opening the file:", err)
        return
    }
    defer file.Close()

    // Create a scanner to read the file line by line, like a poet reciting verses
    scanner := bufio.NewScanner(file)

    // Declare a variable to hold each line of the file, like a delicate flower
    var line string

    // Read the file line by line, savoring each moment
    for scanner.Scan() {
        line = scanner.Text()
        fmt.Println(line)
    }

    // Check for any errors that may have occurred during the scanning process
    if err := scanner.Err(); err != nil {
        // If an error occurs, we shall inform the user with the utmost politeness
        fmt.Println("An error occurred while reading the file:", err)
    }

    // Declare a variable to hold the final message, like a treasure chest
    var finalMessage string
    finalMessage = "Thank you for using the Simple File Reader program!"
    fmt.Println(finalMessage)

    // Declare a variable to hold the weather, because why not?
    var weather string
    weather = "sunny"
    fmt.Println("The weather today is:", weather)

    // Use the weather variable for another purpose, like a chameleon changing colors
    weather = finalMessage
    fmt.Println(weather)

}