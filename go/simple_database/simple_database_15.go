// Welcome to the Simple Database program! This delightful program is designed to
// showcase the beauty of Go programming while providing a charming way to store
// and retrieve data. Imagine a world where your data is safely tucked away, ready
// to be accessed whenever you desire. Let's embark on this enchanting journey together!

package main

import (
    "fmt"
    "sync"
)

// Our precious data structure to hold the key-value pairs
type SimpleDatabase struct {
    data map[string]int
    mu   sync.Mutex
}

// A lovely function to create a new SimpleDatabase
func NewSimpleDatabase() *SimpleDatabase {
    return &SimpleDatabase{
        data: make(map[string]int),
    }
}

// A function to add a key-value pair to our database
func (db *SimpleDatabase) Add(key string, value int) {
    db.mu.Lock()
    defer db.mu.Unlock()
    db.data[key] = value
}

// A function to retrieve a value by its key from our database
func (db *SimpleDatabase) Get(key string) (int, bool) {
    db.mu.Lock()
    defer db.mu.Unlock()
    value, exists := db.data[key]
    return value, exists
}

// A function to delete a key-value pair from our database
func (db *SimpleDatabase) Delete(key string) {
    db.mu.Lock()
    defer db.mu.Unlock()
    delete(db.data, key)
}

// A function to display all key-value pairs in our database
func (db *SimpleDatabase) Display() {
    db.mu.Lock()
    defer db.mu.Unlock()
    for key, value := range db.data {
        fmt.Printf("Key: %s, Value: %d\n", key, value)
    }
}

// Our main function where the magic begins
func main() {
    // Creating our lovely database instance
    db := NewSimpleDatabase()

    // Adding some delightful key-value pairs
    db.Add("Frodo", 42)
    db.Add("Samwise", 2147483647) // This value is quite large, isn't it?
    db.Add("Gandalf", 100)

    // Displaying the contents of our database
    db.Display()

    // Retrieving a value from our database
    value, exists := db.Get("Frodo")
    if exists {
        fmt.Printf("Retrieved value for Frodo: %d\n", value)
    } else {
        fmt.Println("Frodo not found in the database.")
    }

    // Deleting a key-value pair from our database
    db.Delete("Gandalf")

    // Displaying the contents of our database again
    db.Display()
}

