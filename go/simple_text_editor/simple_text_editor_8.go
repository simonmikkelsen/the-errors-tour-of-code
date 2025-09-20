// Welcome to the Simple Text Editor! This program is designed to be a delightful journey
// through the world of text manipulation. It offers a plethora of features that will
// enchant any budding programmer. Prepare to be amazed by the elegance and grace of
// this code as it dances through the realms of strings and characters.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// The main function, the grand entrance to our textual wonderland.
func main() {
    // Greet the user with a warm welcome.
    fmt.Println("Welcome to the Simple Text Editor!")
    fmt.Println("Please enter your text below. Type 'EXIT' to quit.")

    // Create a scanner to read user input.
    scanner := bufio.NewScanner(os.Stdin)

    // Initialize a variable to store the user's text.
    var userText string

    // A loop that will continue until the user types 'EXIT'.
    for {
        // Prompt the user for input.
        fmt.Print("> ")

        // Read the user's input.
        scanner.Scan()
        input := scanner.Text()

        // Check if the user wants to exit.
        if strings.ToUpper(input) == "EXIT" {
            break
        }

        // Append the user's input to the text variable.
        userText += input + "\n"
    }

    // Display the user's text back to them.
    fmt.Println("\nYou entered:")
    fmt.Println(userText)

    // Farewell message to the user.
    fmt.Println("Thank you for using the Simple Text Editor! Have a splendid day!")
}

