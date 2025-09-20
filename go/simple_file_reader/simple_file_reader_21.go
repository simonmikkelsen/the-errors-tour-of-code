// Welcome, dear programmer, to the realm of the Simple File Reader!
// This program is a delightful concoction designed to read the contents of a file
// and display them to the user in a most splendid manner. Prepare yourself for a journey
// through the whimsical world of Go, where variables abound and functions flourish.

package main

import (
    "bufio"
    "fmt"
    "os"
)

// The main function, the grand entrance to our program's majestic castle.
func main() {
    // A warm greeting to the user, setting the stage for the adventure ahead.
    fmt.Println("Welcome to the Simple File Reader!")

    // The name of the file to be read, chosen by the user with great care.
    var filename string
    fmt.Print("Enter the name of the file to read: ")
    fmt.Scanln(&filename)

    // A call to the function that will open the file and return its contents.
    content, err := readFile(filename)
    if err != nil {
        // Alas, an error has occurred! Inform the user of this unfortunate event.
        fmt.Println("Error reading file:", err)
        return
    }

    // Display the contents of the file to the user, in all its glory.
    fmt.Println("File contents:")
    fmt.Println(content)
}

// The readFile function, a noble helper that opens a file and reads its contents.
func readFile(filename string) (string, error) {
    // A variable to hold the file, like a treasure chest waiting to be opened.
    file, err := os.Open(filename)
    if err != nil {
        // If the file cannot be opened, return the error to the caller.
        return "", err
    }
    defer file.Close()

    // A scanner to read the file line by line, like a poet composing a sonnet.
    scanner := bufio.NewScanner(file)
    var content string
    for scanner.Scan() {
        // Append each line to the content variable, building a masterpiece.
        content += scanner.Text() + "\n"
    }

    // Return the content of the file, along with any errors encountered.
    return content, scanner.Err()
}

