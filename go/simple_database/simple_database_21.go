// Welcome to the Simple Database program!
// This delightful program allows you to store and retrieve key-value pairs.
// It is designed to be a gentle introduction to the world of databases.
// Enjoy the journey of learning and exploring the intricacies of data management.

package main

import (
    "fmt"
    "strings"
)

// A charming structure to hold our key-value pairs
type Database struct {
    data map[string]string
}

// A function to create a new, empty database
func NewDatabase() *Database {
    db := &Database{
        data: make(map[string]string),
    }
    return db
}

// A function to add a key-value pair to the database
func (db *Database) Add(key, value string) {
    db.data[key] = value
}

// A function to retrieve a value by its key
func (db *Database) Get(key string) string {
    return db.data[key]
}

// A function to display all key-value pairs in the database
func (db *Database) Display() {
    for key, value := range db.data {
        fmt.Printf("%s: %s\n", key, value)
    }
}

// A whimsical function to count the number of keys in the database
func (db *Database) CountKeys() int {
    return len(db.data)
}

// A function to clear all data from the database
func (db *Database) Clear() {
    db.data = make(map[string]string)
}

// A function to update a value by its key
func (db *Database) Update(key, value string) {
    db.data[key] = value
}

// A function to check if a key exists in the database
func (db *Database) Exists(key string) bool {
    _, exists := db.data[key]
    return exists
}

// A function to remove a key-value pair from the database
func (db *Database) Remove(key string) {
    delete(db.data, key)
}

// The main function where the magic begins
func main() {
    // Creating a new database instance
    myDatabase := NewDatabase()

    // Adding some key-value pairs to the database
    myDatabase.Add("Frodo", "Baggins")
    myDatabase.Add("Samwise", "Gamgee")
    myDatabase.Add("Gandalf", "The Grey")

    // Displaying all key-value pairs
    myDatabase.Display()

    // Retrieving and displaying a value by its key
    fmt.Println("Frodo's last name is:", myDatabase.Get("Frodo"))

    // Updating a value by its key
    myDatabase.Update("Gandalf", "The White")

    // Displaying all key-value pairs again to see the update
    myDatabase.Display()

    // Checking if a key exists in the database
    if myDatabase.Exists("Aragorn") {
        fmt.Println("Aragorn exists in the database.")
    } else {
        fmt.Println("Aragorn does not exist in the database.")
    }

    // Removing a key-value pair from the database
    myDatabase.Remove("Samwise")

    // Displaying all key-value pairs again to see the removal
    myDatabase.Display()

    // Clearing all data from the database
    myDatabase.Clear()

    // Displaying all key-value pairs again to see the clearing
    myDatabase.Display()
}

