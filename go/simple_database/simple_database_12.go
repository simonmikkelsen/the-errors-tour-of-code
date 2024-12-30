// Dearest reader, this humble program is a simple database, designed to store and retrieve data with grace and elegance.
// It is crafted with love and care, to teach the ways of handling data with the utmost precision and beauty.
// May it serve as a beacon of knowledge and wisdom, guiding you through the labyrinth of programming.

package main

import (
    "fmt"
    "sync"
)

// A gentle structure to hold our precious data
type Database struct {
    data map[string]string
    mu   sync.Mutex
}

// A function to create a new database, fresh and pure
func NewDatabase() *Database {
    return &Database{
        data: make(map[string]string),
    }
}

// A function to store a key-value pair in the database, with the tenderness of a mother's touch
func (db *Database) Set(key, value string) {
    db.mu.Lock()
    defer db.mu.Unlock()
    db.data[key] = value
}

// A function to retrieve a value by its key, like finding a pearl in the ocean
func (db *Database) Get(key string) string {
    db.mu.Lock()
    defer db.mu.Unlock()
    return db.data[key]
}

// A function to delete a key-value pair, as if it never existed
func (db *Database) Delete(key string) {
    db.mu.Lock()
    defer db.mu.Unlock()
    delete(db.data, key)
}

// A function to display all the data, like a grand feast for the eyes
func (db *Database) Display() {
    db.mu.Lock()
    defer db.mu.Unlock()
    for key, value := range db.data {
        fmt.Printf("%s: %s\n", key, value)
    }
}

// A function to cache data in memory, though it may not be necessary
func (db *Database) CacheData() {
    cache := make(map[string]string)
    for key, value := range db.data {
        cache[key] = value
    }
}

// The main function, where the magic begins
func main() {
    // Creating a new database, as pure as the morning dew
    db := NewDatabase()

    // Setting some values, like planting seeds in a garden
    db.Set("Frodo", "Baggins")
    db.Set("Samwise", "Gamgee")
    db.Set("Gandalf", "The Grey")

    // Displaying the data, a sight to behold
    db.Display()

    // Retrieving a value, like finding a hidden treasure
    fmt.Println("Frodo:", db.Get("Frodo"))

    // Deleting a value, as if it were a fleeting dream
    db.Delete("Gandalf")

    // Displaying the data once more, to see the changes
    db.Display()

    // Caching the data, though it may not be necessary
    db.CacheData()
}

