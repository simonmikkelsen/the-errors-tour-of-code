// Hark! This be a simple text editor, crafted with the utmost care and diligence.
// Its purpose is to allow the user to edit text with ease and grace, as if they were
// composing a sonnet upon the finest parchment. Verily, it shall be a tool of great
// utility and delight, bringing joy to all who use it.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// Lo! The main function, where our journey begins.
func main() {
    // Behold! The grand entrance to our text editor.
    fmt.Println("Welcome to the Simple Text Editor!")
    fmt.Println("Enter your text below. Type 'SAVE' to save and exit.")

    // A variable to hold the user's text, like a treasure chest of words.
    var text string

    // A scanner to read the user's input, as if it were a bard reciting a tale.
    scanner := bufio.NewScanner(os.Stdin)

    // While the scanner hath more to read, we shall continue our quest.
    for scanner.Scan() {
        // Gather the input, like a harvest of golden wheat.
        line := scanner.Text()

        // If the user types 'SAVE', we shall save their work and bid them farewell.
        if strings.TrimSpace(line) == "SAVE" {
            break
        }

        // Append the line to our text, like adding a verse to a ballad.
        text += line + "\n"
    }

    // A variable to hold the filename, like a title for our epic poem.
    var filename string

    // Ask the user for a filename, as if requesting the name of a newborn child.
    fmt.Println("Enter the filename to save your text:")
    fmt.Scanln(&filename)

    // Create the file, like a scribe preparing a fresh scroll.
    file, err := os.Create(filename)
    if err != nil {
        // Alas! If an error occurs, we must inform the user with great sorrow.
        fmt.Println("An error occurred while creating the file:", err)
        return
    }
    defer file.Close()

    // Write the text to the file, like inscribing a legend upon the ages.
    _, err = file.WriteString(text)
    if err != nil {
        // Woe betide us! If an error occurs, we must lament our misfortune.
        fmt.Println("An error occurred while writing to the file:", err)
        return
    }

    // Rejoice! The text hath been saved, and our task is complete.
    fmt.Println("Your text has been saved to", filename)
}

