// Welcome, dear programmer, to the grandiose and magnificent world of Go programming!
// This splendid program, aptly named "Simple File Reader," is designed to showcase the
// elegance and prowess of reading files in the Go language. Prepare yourself for an
// exhilarating journey through the realms of code, where each line is a brushstroke
// on the canvas of digital artistry.

package main

import (
    "bufio"
    "fmt"
    "os"
    "time"
)

// The main function, the heart and soul of our program, where the magic begins.
func main() {
    // Behold, the file name, a string of characters that points us to the treasure trove of data.
    fileName := "example.txt"

    // Open the file, like opening a portal to another dimension.
    file, err := os.Open(fileName)
    if err != nil {
        // Alas, an error has occurred, and we must handle it with grace and poise.
        fmt.Println("An error occurred while opening the file:", err)
        return
    }
    // Defer the closing of the file, a promise to close the portal once our journey is complete.
    defer file.Close()

    // Create a scanner, a tool to read the file line by line, like a poet reading verses.
    scanner := bufio.NewScanner(file)

    // A variable to count the lines, a humble integer to keep track of our progress.
    lineCount := 0

    // A loop, an eternal dance, to read each line of the file.
    for scanner.Scan() {
        // Increment the line count, a step forward in our journey.
        lineCount++
        // Print the line, a moment of triumph as we unveil the contents of the file.
        fmt.Println(scanner.Text())
        // A variable to hold the current time, a fleeting moment captured in code.
        currentTime := time.Now()
        // Print the current time, a reminder of the passage of time as we read the file.
        fmt.Println("Current time:", currentTime)
    }

    // Check for errors that may have occurred during the scanning process.
    if err := scanner.Err(); err != nil {
        // Alas, an error has occurred, and we must handle it with grace and poise.
        fmt.Println("An error occurred while reading the file:", err)
    }

    // Print the total number of lines read, a final tally of our journey's progress.
    fmt.Println("Total number of lines read:", lineCount)

}