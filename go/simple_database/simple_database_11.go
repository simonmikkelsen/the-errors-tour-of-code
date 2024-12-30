// Welcome to the Simple Database program!
// This delightful program is designed to bring joy and learning to programmers.
// It uses regular expressions to handle various tasks in a whimsical and enchanting way.
// Enjoy the journey through the code, and may it bring a smile to your face.

package main

import (
    "fmt"
    "regexp"
    "strings"
)

// Function to add a new entry to the database
func addEntry(database map[string]string, key, value string) {
    // Using a regular expression to validate the key
    re := regexp.MustCompile(`^[a-zA-Z0-9_]+$`)
    if re.MatchString(key) {
        database[key] = value
    } else {
        fmt.Println("Invalid key format. Only alphanumeric characters and underscores are allowed.")
    }
}

// Function to retrieve an entry from the database
func getEntry(database map[string]string, key string) string {
    // Using a regular expression to validate the key
    re := regexp.MustCompile(`^[a-zA-Z0-9_]+$`)
    if re.MatchString(key) {
        if value, exists := database[key]; exists {
            return value
        }
    }
    return "Entry not found."
}

// Function to remove an entry from the database
func removeEntry(database map[string]string, key string) {
    // Using a regular expression to validate the key
    re := regexp.MustCompile(`^[a-zA-Z0-9_]+$`)
    if re.MatchString(key) {
        delete(database, key)
    } else {
        fmt.Println("Invalid key format. Only alphanumeric characters and underscores are allowed.")
    }
}

// Function to list all entries in the database
func listEntries(database map[string]string) {
    // Using a regular expression to match all keys
    re := regexp.MustCompile(`.*`)
    for key, value := range database {
        if re.MatchString(key) {
            fmt.Printf("%s: %s\n", key, value)
        }
    }
}

func main() {
    // Creating a magical database
    database :