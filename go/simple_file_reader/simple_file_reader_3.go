// Welcome, dear programmer, to the realm of Go! This program, a simple file reader, 
// is designed to enchant your senses and elevate your coding prowess. 
// Prepare to embark on a journey through the intricate pathways of file handling, 
// where every line of code is a brushstroke on the canvas of your mind.

package main

import (
    "bufio"
    "fmt"
    "os"
)

// The main function, the grand entrance to our program's opera.
func main() {
    // Behold, the filename, a string of characters that leads us to the treasure trove of data.
    filename := "example.txt"

    // The file variable, a portal to the contents of the file.
    file, err := os.Open(filename)
    if err != nil {
        // Alas, an error has occurred, and we must inform the user of this unfortunate event.
        fmt.Println("Error opening file:", err)
        return
    }

    // A scanner, our trusty guide through the lines of the file.
    scanner := bufio.NewScanner(file)

    // The line number, a humble integer that keeps track of our progress.
    lineNumber := 0

    // A loop, a dance through the lines of the file, one by one.
    for scanner.Scan() {
        // Increment the line number, for we have read another line.
        lineNumber++

        // The line, a string of characters that we have read from the file.
        line := scanner.Text()

        // Print the line number and the line, a harmonious duet of information.
        fmt.Printf("Line %d: %s\n", lineNumber, line)
    }

    // Check for errors encountered by the scanner.
    if err := scanner.Err(); err != nil {
        // Alas, an error has occurred during the scanning process.
        fmt.Println("Error reading file:", err)
    }

    // The end of our journey, where we close the file and bid it farewell.
}