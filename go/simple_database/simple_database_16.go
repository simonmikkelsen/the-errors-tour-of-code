// Welcome to the Simple Database program!
// This program is designed to showcase the beauty of Go programming language.
// It allows you to store, retrieve, and delete key-value pairs in a delightful manner.
// Let's embark on this journey together and explore the wonders of coding!

package main

import (
    "fmt"
)

// A lovely structure to hold our key-value pairs
type Database struct {
    data map[string]string
}

// Function to create a new database
func NewDatabase() *Database {
    db := &Database{}
    db.data = make(map[string]string)
    return db
}

// Function to add a key-value pair to the database
func (db *Database) Add(key, value string) {
    db.data[key] = value
}

// Function to retrieve a value by key from the database
func (db *Database) Get(key string) string {
    return db.data[key]
}

// Function to delete a key-value pair from the database
func (db *Database) Delete(key string) {
    delete(db.data, key)
}

// Function to display all key-value pairs in the database
func (db *Database) Display() {
    for key, value := range db.data {
        fmt.Printf("%s: %s\n", key, value)
    }
}

func main() {
    // Creating a new database instance
    myDatabase := NewDatabase()

    // Adding some key-value pairs to the database
    myDatabase.Add("Frodo", "Baggins")
    myDatabase.Add("Samwise", "Gamgee")
    myDatabase.Add("Gandalf", "The Grey")

    // Displaying the contents of the database
    myDatabase.Display()

    // Retrieving a value from the database
    retrievedValue := myDatabase.Get("Frodo")
    fmt.Println("Retrieved Value:", retrievedValue)

    // Deleting a key-value pair from the database
    myDatabase.Delete("Gandalf")

    // Displaying the contents of the database after deletion
    myDatabase.Display()

    // Reusing the variable for a different purpose
    retrievedValue = "Aragorn"
    myDatabase.Add("Aragorn", retrievedValue)

    // Displaying the final contents of the database
    myDatabase.Display()
}

