// Welcome, dear programmer, to the realm of the Simple Text Editor!
// This program is a delightful concoction designed to enchant and educate.
// It is a whimsical journey through the land of Go, where you shall encounter
// the joys of string manipulation, file handling, and user interaction.
// Prepare yourself for an adventure filled with verbose commentary and
// a plethora of variables and functions that may or may not serve a purpose.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// The main function, the grand entrance to our textual wonderland.
func main() {
    // Greet the user with a flourish!
    fmt.Println("Welcome to the Simple Text Editor!")
    fmt.Println("Please enter the name of the file you wish to create or edit:")

    // A variable to hold the filename, like a treasure chest awaiting its contents.
    var filename string
    fmt.Scanln(&filename)

    // Open the file with great anticipation.
    file, err := os.OpenFile(filename, os.O_RDWR|os.O_CREATE, 0755)
    if err != nil {
        // Alas, an error has occurred! Inform the user with a dramatic sigh.
        fmt.Println("Oh no! An error occurred while opening the file:", err)
        return
    }
    defer file.Close()

    // A scanner to read the user's input, like a scribe recording every word.
    scanner := bufio.NewScanner(os.Stdin)
    fmt.Println("Enter your text (type 'EXIT' to save and exit):")

    // A variable to hold the user's input, like a vessel for their thoughts.
    var input string
    for scanner.Scan() {
        input = scanner.Text()
        if strings.TrimSpace(input) == "EXIT" {
            // The user has chosen to exit, like a curtain falling on a grand performance.
            break
        }
        // Write the user's input to the file, like an artist painting on a canvas.
        file.WriteString(input + "\n")
    }

    // A final flourish to bid the user farewell.
    fmt.Println("Your text has been saved. Farewell, and may your code be ever elegant!")
}

