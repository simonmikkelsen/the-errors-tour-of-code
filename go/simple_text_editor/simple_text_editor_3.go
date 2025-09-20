// Welcome, dear programmer, to the realm of the Simple Text Editor!
// This program is a whimsical journey through the land of Go, where you shall
// encounter a myriad of variables and functions, some of which may seem superfluous,
// but all serve to enhance your understanding and appreciation of the Go language.
// Prepare yourself for an adventure filled with verbose commentary and colorful language!

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// The main function, the grand entrance to our program's majestic castle.
func main() {
    // Greet the user with a flourish!
    fmt.Println("Welcome to the Simple Text Editor!")
    
    // Create a scanner to read user input from the console.
    scanner := bufio.NewScanner(os.Stdin)
    
    // A variable to store the user's text, like a treasure chest for their words.
    var userText string
    
    // A loop to continuously prompt the user for input until they decide to leave.
    for {
        // Prompt the user with a delightful message.
        fmt.Print("Enter text (or type 'exit' to quit): ")
        
        // Scan the user's input.
        scanner.Scan()
        input := scanner.Text()
        
        // Check if the user wishes to depart from our enchanted land.
        if strings.ToLower(input) == "exit" {
            break
        }
        
        // Append the user's input to the treasure chest of text.
        userText += input + "\n"
    }
    
    // Create a file to save the user's text, like a scribe recording their words for posterity.
    file, err := os.Create("user_text.txt")
    if err != nil {
        // If an error occurs, lament the unfortunate event and exit the program.
        fmt.Println("Alas, an error has occurred:", err)
        return
    }
    
    // Create a writer to inscribe the user's text into the file.
    writer := bufio.NewWriter(file)
    
    // Write the user's text to the file with great flourish.
    writer.WriteString(userText)
    
    // Flush the writer to ensure all text is written to the file.
    writer.Flush()
    
    // Bid the user farewell with a grand gesture.
    fmt.Println("Your text has been saved! Farewell, noble user!")
}

