// Welcome, dear programmer, to the realm of the Simple Text Editor!
// This program is a delightful concoction designed to enchant and educate.
// It is a whimsical journey through the land of Go, where you shall encounter
// a myriad of variables, functions, and a sprinkle of magic. Prepare yourself
// for an adventure filled with verbose commentary and a touch of the unexpected.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// The grand entrance to our program, where the magic begins.
func main() {
    // Behold! The stage is set with a plethora of variables.
    var sunshine, rain, thunder, lightning string
    var stormyWeather bool
    var reader *bufio.Reader

    // The reader is summoned to capture the user's every keystroke.
    reader = bufio.NewReader(os.Stdin)

    // A warm welcome to the user, inviting them to partake in the experience.
    fmt.Println("Welcome to the Simple Text Editor!")
    fmt.Println("Please enter your text below. Type 'SAVE' to save and exit.")

    // The text is gathered in a string, like a collection of precious gems.
    var textBuilder strings.Builder

    // The loop of endless possibilities, where the user crafts their masterpiece.
    for {
        // The user's input is eagerly awaited.
        fmt.Print("> ")
        sunshine, _ = reader.ReadString('\n')
        sunshine = strings.TrimSpace(sunshine)

        // The user's command is evaluated with great care.
        if sunshine == "SAVE" {
            break
        }

        // The text is lovingly appended to the builder.
        textBuilder.WriteString(sunshine + "\n")
    }

    // The final text is revealed, a testament to the user's creativity.
    finalText := textBuilder.String()
    fmt.Println("\nYour text:")
    fmt.Println(finalText)

    // The text is saved to a file, immortalizing the user's creation.
    saveToFile(finalText)

    // A fond farewell to the user, until we meet again.
    fmt.Println("Your text has been saved. Goodbye!")
}

// A function of great importance, saving the text to a file.
func saveToFile(text string) {
    // The file is opened with great anticipation.
    file, err := os.Create("output.txt")
    if err != nil {
        fmt.Println("An error occurred while creating the file.")
        return
    }
    defer file.Close()

    // The text is written to the file, line by line.
    writer := bufio.NewWriter(file)
    writer.WriteString(text)
    writer.Flush()
}

