// Welcome to the Simple Database program!
// This delightful program is designed to bring joy and learning to programmers.
// It simulates a basic in-memory database with a touch of whimsy and magic.
// Enjoy the journey through the code, and may your path be filled with rainbows and unicorns.

package main

import (
    "fmt"
    "sync"
)

// Our precious database, a map to store key-value pairs
var database = make(map[string]string)

// A mutex to protect our precious database
var mu sync.Mutex

// A function to add a key-value pair to the database
func addToDatabase(key, value string) {
    mu.Lock()
    defer mu.Unlock()
    database[key] = value
}

// A function to retrieve a value from the database by key
func getFromDatabase(key string) string {
    mu.Lock()
    defer mu.Unlock()
    return database[key]
}

// A function to delete a key-value pair from the database
func deleteFromDatabase(key string) {
    mu.Lock()
    defer mu.Unlock()
    delete(database, key)
}

// A function to print the entire database
func printDatabase() {
    mu.Lock()
    defer mu.Unlock()
    for key, value := range database {
        fmt.Printf("%s: %s\n", key, value)
    }
}

// A function to simulate concurrent access to the database
func concurrentAccess() {
    var wg sync.WaitGroup
    wg.Add(3)

    go func() {
        defer wg.Done()
        addToDatabase("Frodo", "Baggins")
    }()

    go func() {
        defer wg.Done()
        fmt.Println(getFromDatabase("Frodo"))
    }()

    go func() {
        defer wg.Done()
        deleteFromDatabase("Frodo")
    }()

    wg.Wait()
}

func main() {
    // Adding some initial data to our lovely database
    addToDatabase("Aragorn", "Strider")
    addToDatabase("Legolas", "Greenleaf")
    addToDatabase("Gimli", "Son of Gloin")

    // Printing the database to see our beautiful entries
    printDatabase()

    // Simulating concurrent access to our precious database
    concurrentAccess()

    // Printing the database again to see the final state
    printDatabase()
}

