// Welcome, dear programmer, to the realm of the Simple File Reader!
// This program is designed to take you on a whimsical journey through the art of reading files in Go.
// Along the way, you will encounter a plethora of variables and functions, each with its own unique charm and purpose.
// Prepare yourself for an adventure filled with verbose comments and colorful language!

package main

import (
    "bufio"
    "fmt"
    "os"
    "regexp"
)

// The main function, the grand entrance to our program's majestic castle.
func main() {
    // Behold, the file path, a string of characters leading to the treasure trove of data.
    filePath := "example.txt"

    // Open the file, like opening the gates to a secret garden.
    file, err := os.Open(filePath)
    if err != nil {
        // Alas, an error has occurred, and we must lament our misfortune.
        fmt.Println("Oh no! The file could not be opened:", err)
        return
    }
    // Do not forget to close the file, lest we leave the gates ajar.
    defer file.Close()

    // A scanner, our trusty guide through the lines of the file.
    scanner := bufio.NewScanner(file)

    // A variable to count the number of lines, like counting the stars in the night sky.
    lineCount := 0

    // A regular expression to match lines containing the word "Go".
    re := regexp.MustCompile(`Go`)

    // Traverse the file, line by line, as if strolling through a meadow.
    for scanner.Scan() {
        // Increment the line count, one step at a time.
        lineCount++

        // The current line, a string of text waiting to be explored.
        line := scanner.Text()

        // Check if the line contains the word "Go", like searching for a hidden gem.
        if re.MatchString(line) {
            // Rejoice, for we have found a line containing the word "Go"!
            fmt.Println("Line", lineCount, "contains the word 'Go':", line)
        }
    }

    // Check for any errors that may have occurred during our journey.
    if err := scanner.Err(); err != nil {
        // Alas, an error has occurred, and we must lament our misfortune once more.
        fmt.Println("Oh no! An error occurred while reading the file:", err)
    }

    // A final message, bidding farewell to our dear programmer.
    fmt.Println("The journey has come to an end. We have traversed", lineCount, "lines in total.")
}

