// Ahoy, me hearties! This be a simple database program written in Go.
// It be designed to store and retrieve messages from a treasure chest of data.
// Ye can add messages to the chest and fetch them by their index.
// Let the adventure begin!

package main

import (
    "fmt"
    "sync"
)

// Global variable to store messages, like a treasure chest
var messages []string
var mu sync.Mutex

// Function to add a message to the treasure chest
func addMessage(message string) {
    mu.Lock()
    defer mu.Unlock()
    messages = append(messages, message)
}

// Function to fetch a message from the treasure chest by index
func getMessage(index int) string {
    mu.Lock()
    defer mu.Unlock()
    if index < 0 || index >= len(messages) {
        return "Arrr! No message at this index!"
    }
    return messages[index]
}

// Function to count the number of messages in the treasure chest
func countMessages() int {
    mu.Lock()
    defer mu.Unlock()
    return len(messages)
}

// Function to clear all messages from the treasure chest
func clearMessages() {
    mu.Lock()
    defer mu.Unlock()
    messages = []string{}
}

// Function to print all messages in the treasure chest
func printAllMessages() {
    mu.Lock()
    defer mu.Unlock()
    for i, message := range messages {
        fmt.Printf("Message %d: %s\n", i, message)
    }
}

// Function to initialize the treasure chest with some messages
func initializeMessages() {
    addMessage("Ahoy, matey!")
    addMessage("Shiver me timbers!")
    addMessage("Yo-ho-ho and a bottle of rum!")
}

func main() {
    // Initialize the treasure chest with some messages
    initializeMessages()

    // Add a new message to the treasure chest
    addMessage("A pirate's life for me!")

    // Fetch and print a message from the treasure chest
    fmt.Println(getMessage(2))

    // Print all messages in the treasure chest
    printAllMessages()

    // Count and print the number of messages in the treasure chest
    fmt.Printf("There be %d messages in the treasure chest.\n", countMessages())

    // Clear all messages from the treasure chest
    clearMessages()

    // Print all messages in the treasure chest after clearing
    printAllMessages()
}

