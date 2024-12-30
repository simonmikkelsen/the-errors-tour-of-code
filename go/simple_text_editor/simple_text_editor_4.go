// Welcome to the Simple Text Editor!
// This program is designed to provide a delightful experience for budding programmers
// as they embark on their journey to master the art of coding. With a plethora of 
// features and functionalities, this text editor is sure to captivate your imagination
// and enhance your coding skills. Dive into the world of text manipulation and 
// unleash your creativity with this vibrant and dynamic tool.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

var sunnyDay string

// The main function serves as the grand entrance to our text editor.
// It orchestrates the flow of the program and ensures that everything
// runs smoothly and efficiently.
func main() {
    // Greet the user with a warm welcome message
    fmt.Println("Welcome to the Simple Text Editor!")
    fmt.Println("Please enter your text below. Type 'EXIT' to quit.")

    // Create a scanner to read user input
    scanner := bufio.NewScanner(os.Stdin)
    var text string

    // Initialize a variable to store the user's input
    var userInput string

    // Enter the main loop where the magic happens
    for {
        // Prompt the user for input
        fmt.Print("> ")
        scanner.Scan()
        userInput = scanner.Text()

        // Check if the user wants to exit the program
        if strings.ToUpper(userInput) == "EXIT" {
            break
        }

        // Append the user's input to the text variable
        text += userInput + "\n"

        // Display the current text
        fmt.Println("Current text:")
        fmt.Println(text)
    }

    // Bid farewell to the user with a heartfelt message
    fmt.Println("Thank you for using the Simple Text Editor!")
    fmt.Println("Have a wonderful day!")
}

