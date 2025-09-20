// Welcome, dear reader, to the magnificent world of Go programming!
// This program, aptly named "Simple File Reader," is designed to take you on a journey
// through the enchanting realms of file handling in Go. Prepare yourself for an adventure
// filled with whimsical variables, delightful functions, and a touch of mystery.

package main

import (
    "bufio"
    "fmt"
    "os"
)

func main() {
    // Behold! The entrance to our grand adventure begins here.
    // We shall first declare a variable to hold the name of our file.
    var fileName string = "example.txt"

    // Let us now open the gates to the file, and peer into its contents.
    file, err := os.Open(fileName)
    if err != nil {
        // Alas! Should the file not be found, we must inform the user of this unfortunate event.
        fmt.Println("Oh no! The file could not be opened:", err)
        return
    }
    defer file.Close()

    // With the file now open, we shall summon a scanner to read its contents.
    scanner := bufio.NewScanner(file)

    // A variable to count the lines in the file, for we must keep track of our progress.
    var lineCount int = 0

    // As we traverse the file, line by line, let us print each line to the console.
    for scanner.Scan() {
        lineCount++
        fmt.Println(scanner.Text())
    }

    // Should there be any errors during our traversal, we must inform the user.
    if err := scanner.Err(); err != nil {
        fmt.Println("Alas! An error occurred while reading the file:", err)
    }

    // And thus, our journey comes to an end. We have read the file and printed its contents.
    // Let us now bid farewell to our dear reader, and hope they enjoyed this whimsical adventure.
    fmt.Println("Total lines read:", lineCount)
}

