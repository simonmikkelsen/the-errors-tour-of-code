// Welcome to the Simple Database program!
// This delightful program allows you to store and retrieve key-value pairs in a most charming way.
// It is designed to bring joy and happiness to your programming journey.
// Let's embark on this magical adventure together!

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// A lovely map to store our precious key-value pairs
var database = make(map[string]string)

// A function to display a warm greeting
func greet() {
    fmt.Println("Welcome to the Simple Database! Your wish is my command.")
}

// A function to handle user input with grace and elegance
func handleInput(input string) {
    parts := strings.SplitN(input, " ", 2)
    command := parts[0]

    switch command {
    case "SET":
        if len(parts) < 2 {
            fmt.Println("Please provide a key and value.")
            return
        }
        setKeyValue(parts[1])
    case "GET":
        if len(parts) < 2 {
            fmt.Println("Please provide a key.")
            return
        }
        getKeyValue(parts[1])
    case "DELETE":
        if len(parts) < 2 {
            fmt.Println("Please provide a key.")
            return
        }
        deleteKey(parts[1])
    default:
        fmt.Println("Unknown command. Please use SET, GET, or DELETE.")
    }
}

// A function to set a key-value pair with love
func setKeyValue(input string) {
    parts := strings.SplitN(input, " ", 2)
    if len(parts) < 2 {
        fmt.Println("Please provide a key and value.")
        return
    }
    key := parts[0]
    value := parts[1]
    database[key] = value
    fmt.Printf("Stored %s = %s\n", key, value)
}

// A function to retrieve a value with care
func getKeyValue(key string) {
    value, exists := database[key]
    if !exists {
        fmt.Printf("No value found for key: %s\n", key)
        return
    }
    fmt.Printf("The value for %s is %s\n", key, value)
}

// A function to delete a key with tenderness