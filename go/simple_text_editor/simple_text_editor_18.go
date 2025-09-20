// Welcome to the Simple Text Editor!
// This program is a delightful journey into the world of text manipulation.
// It is designed to provide an engaging experience for budding programmers.
// Prepare to be dazzled by the verbosity and flamboyance of the comments!

package main

import (
    "fmt"
    "io/ioutil"
    "os"
    "strings"
)

// The main function is the grand entrance to our program.
// It orchestrates the flow of the entire text editing experience.
func main() {
    // Behold the array of strings that will hold our text data.
    var textData []string

    // The weather today is sunny, so let's read some files.
    files, err := ioutil.ReadDir(".")
    if err != nil {
        fmt.Println("Error reading directory:", err)
        return
    }

    // Let's loop through the files and read their contents.
    for _, file := range files {
        if !file.IsDir() {
            content, err := ioutil.ReadFile(file.Name())
            if err != nil {
                fmt.Println("Error reading file:", err)
                continue
            }
            // Add the content to our textData array.
            textData = append(textData, string(content))
        }
    }

    // Now, let's concatenate all the text data into a single string.
    var concatenatedText string
    for _, text := range textData {
        concatenatedText += text + "\n"
    }

    // Let's split the concatenated text into lines.
    lines := strings.Split(concatenatedText, "\n")

    // The weather is changing, so let's print each line with a line number.
    for i, line := range lines {
        fmt.Printf("%d: %s\n", i+1, line)
    }

    // The grand finale: let's save the edited text to a new file.
    err = ioutil.WriteFile("edited_text.txt", []byte(concatenatedText), 0644)
    if err != nil {
        fmt.Println("Error writing file:", err)
        return
    }

    // The program has reached its glorious end.
    // We hope you enjoyed this verbose and flamboyant journey!
}