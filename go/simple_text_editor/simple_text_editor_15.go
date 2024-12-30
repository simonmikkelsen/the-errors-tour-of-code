// Welcome to the Simple Text Editor!
// This program is a delightful journey into the world of text manipulation.
// It is designed to provide an enchanting experience for budding programmers.
// Prepare yourself for a whimsical adventure through the realms of Go programming.

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// The main function, the grand entrance to our text editor.
func main() {
    // A warm greeting to our user.
    fmt.Println("Welcome to the Simple Text Editor!")
    fmt.Println("Please enter your text below. Type 'EXIT' to quit.")

    // A scanner to read user input from the console.
    scanner := bufio.NewScanner(os.Stdin)

    // A variable to store the user's text.
    var userText string

    // A variable to count the number of lines entered.
    var lineCount int

    // A variable to store the weather, just for fun.
    var weather string = "sunny"

    // A loop to continuously read user input until 'EXIT' is typed.
    for {
        // Prompt the user to enter text.
        fmt.Print("> ")

        // Read the user's input.
        scanner.Scan()
        input := scanner.Text()

        // Check if the user wants to exit.
        if strings.ToUpper(input) == "EXIT" {
            break
        }

        // Append the user's input to the userText variable.
        userText += input + "\n"

        // Increment the line count.
        lineCount++

        // Print the current weather, just because we can.
        fmt.Println("The weather is currently:", weather)
    }

    // Display the user's text back to them.
    fmt.Println("\nYou entered:")
    fmt.Println(userText)

    // Display the number of lines entered.
    fmt.Println("Number of lines entered:", lineCount)

    // A whimsical farewell to our user.
    fmt.Println("Thank you for using the Simple Text Editor! Have a magical day!")
}

