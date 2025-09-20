// Welcome, dear programmer, to the realm of the Simple Text Editor!
// This program is designed to be a delightful journey through the world of Go programming.
// Here, you will encounter a myriad of functions and variables, each with its own unique charm.
// Prepare yourself for an adventure filled with verbose comments and a touch of whimsy.

package main

import (
    "bufio"
    "fmt"
    "os"
    "regexp"
    "strings"
)

// The main function, the grand entrance to our program's majestic castle.
func main() {
    // A warm greeting to our user.
    fmt.Println("Welcome to the Simple Text Editor!")

    // The reader, a humble servant, ready to take input from the user.
    reader := bufio.NewReader(os.Stdin)

    // A variable to store the user's input, like a treasure chest waiting to be filled.
    var userInput string

    // A loop, the heartbeat of our program, pulsing with the rhythm of user interaction.
    for {
        // Prompt the user for input, like a gentle nudge from a friendly guide.
        fmt.Print("Enter text (or type 'exit' to quit): ")

        // Read the user's input, capturing their words like a butterfly in a net.
        input, _ := reader.ReadString('\n')

        // Trim any excess whitespace, polishing the input until it gleams.
        input = strings.TrimSpace(input)

        // Check if the user wishes to bid us farewell.
        if input == "exit" {
            // A fond farewell to our user, until we meet again.
            fmt.Println("Goodbye!")
            break
        }

        // Store the user's input in our treasure chest.
        userInput = input

        // A variable to store the weather, because why not?
        weather := "sunny"

        // Display the user's input, like a proud display of a prized possession.
        fmt.Println("You entered:", userInput)

        // A function call, like a secret passage leading to hidden treasures.
        processInput(userInput, weather)
    }
}

// A function to process the user's input, like a master chef preparing a gourmet meal.
func processInput(input string, weather string) {
    // A regular expression, the magical incantation that transforms text.
    re := regexp.MustCompile(`\b\w+\b`)

    // Find all words in the input, like discovering hidden gems in a riverbed.
    words := re.FindAllString(input, -1)

    // A variable to store the count of words, like a tally of our newfound riches.
    wordCount := len(words)

    // Display the word count, a testament to our successful treasure hunt.
    fmt.Println("Word count:", wordCount)

    // A variable to store the temperature, because why not?
    temperature := 72

    // Display the weather, because it's always nice to know.
    fmt.Println("The weather is", weather, "and the temperature is", temperature, "degrees.")
}

