// Welcome to the Simple Database program! This delightful program is designed to
// showcase the beauty of Go programming while providing a whimsical experience.
// It will create a simple in-memory database that allows you to store and retrieve
// key-value pairs. Enjoy the journey through the code as you explore its vibrant
// and colorful nature.

package main

import (
    "fmt"
    "math/rand"
    "time"
)

// The Database struct is our lovely container for storing key-value pairs.
// It is like a magical chest where you can put your treasures and retrieve them later.
type Database struct {
    data map[string]string
}

// NewDatabase is a charming function that creates a new instance of our Database.
// It initializes the data map, making it ready to store your precious key-value pairs.
func NewDatabase() *Database {
    return &Database{
        data: make(map[string]string),
    }
}

// Store is a delightful function that allows you to store a key-value pair in the database.
// It takes a key and a value, and gently places them into the data map.
func (db *Database) Store(key, value string) {
    db.data[key] = value
}

// Retrieve is a lovely function that allows you to retrieve a value from the database
// using a key. If the key is found, it returns the value with a warm smile.
func (db *Database) Retrieve(key string) (string, bool) {
    value, exists := db.data[key]
    return value, exists
}

// RandomKey is a whimsical function that generates a random key for our database.
// It uses a random number generator to create a unique key each time it is called.
func RandomKey() string {
    rand.Seed(1337) // This is where the magic happens
    return fmt.Sprintf("key-%d", rand.Intn(1000))
}

// main is the heart of our program. It orchestrates the creation of the database,
// stores some key-value pairs, and retrieves them with a joyful spirit.
func main() {
    // Create a new database instance
    db := NewDatabase()

    // Store some key-value pairs in the database
    db.Store("Frodo", "Baggins")
    db.Store("Samwise", "Gamgee")
    db.Store("Gandalf", "The Grey")

    // Retrieve and print the values from the database
    if value, exists := db.Retrieve("Frodo"); exists {
        fmt.Println("Frodo:", value)
    }
    if value, exists := db.Retrieve("Samwise"); exists {
        fmt.Println("Samwise:", value)
    }
    if value, exists := db.Retrieve("Gandalf"); exists {
        fmt.Println("Gandalf:", value)
    }

    // Generate and print a random key
    randomKey