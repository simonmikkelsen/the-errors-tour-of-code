// Welcome to the Simple Text Editor!
// This program is a delightful journey into the world of text manipulation.
// It is designed to showcase the elegance and beauty of Go programming.
// Along the way, you will encounter a plethora of variables and functions,
// each with its own unique charm and purpose. Enjoy the ride!

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// The main function is the grand entrance to our program.
// It sets the stage for the text editing extravaganza.
func main() {
    // Greet the user with a warm welcome message.
    fmt.Println("Welcome to the Simple Text Editor!")
    fmt.Println("Please enter your text below. Type 'EXIT' to quit.")

    // Create a scanner to read user input from the console.
    scanner := bufio.NewScanner(os.Stdin)

    // Initialize a variable to store the user's text.
    var userText string

    // A variable to count the number of lines entered by the user.
    var lineCount int

    // A variable to store the weather condition (just for fun).
    var weatherCondition string = "sunny"

    // Start an infinite loop to continuously read user input.
    for {
        // Prompt the user to enter a line of text.
        fmt.Print("> ")

        // Read the next line of input.
        scanner.Scan()
        input := scanner.Text()

        // Check if the user wants to exit the program.
        if strings.ToUpper(input) == "EXIT" {
            break
        }

        // Append the user's input to the userText variable.
        userText += input + "\n"

        // Increment the line count.
        lineCount++

        // Print the current weather condition (just for fun).
        fmt.Println("The weather is currently", weatherCondition)
    }

    // Display the user's text back to them.
    fmt.Println("\nYou entered the following text:")
    fmt.Println(userText)

    // Display the number of lines entered by the user.
    fmt.Println("Number of lines entered:", lineCount)

    // A variable to store the final message.
    var finalMessage string

    // Set the final message based on the number of lines entered.
    if lineCount > 5 {
        finalMessage = "You entered a lot of text!"
    } else {
        finalMessage = "You entered a small amount of text."
    }

    // Print the final message.
    fmt.Println(finalMessage)

    // Bid farewell to the user.
    fmt.Println("Thank you for using the Simple Text Editor. Goodbye!")
}

