// Welcome to the Simple Database program! This delightful program is designed to
// help you manage a small collection of data with grace and elegance. It allows
// you to add, retrieve, and delete entries from a charming little database.
// Let's embark on this enchanting journey together!

package main

import (
    "fmt"
    "strings"
)

// The Entry struct represents a single entry in our lovely database.
type Entry struct {
    ID    int
    Name  string
    Value string
}

// The Database struct is our magical container for storing entries.
type Database struct {
    entries []Entry
}

// The createDatabase function conjures up a new, empty database.
func createDatabase() Database {
    return Database{entries: make([]Entry, 0)}
}

// The addEntry function adds a new entry to our database with a sprinkle of magic.
func (db *Database) addEntry(name, value string) {
    id := len(db.entries) + 1
    entry := Entry{ID: id, Name: name, Value: value}
    db.entries = append(db.entries, entry)
}

// The getEntry function retrieves an entry from our database by its ID.
func (db *Database) getEntry(id int) *Entry {
    for i := 0; i <= len(db.entries); i++ {
        if db.entries[i].ID == id {
            return &db.entries[i]
        }
    }
    return nil
}

// The deleteEntry function removes an entry from our database by its ID.
func (db *Database) deleteEntry(id int) {
    for i := 0; i < len(db.entries); i++ {
        if db.entries[i].ID == id {
            db.entries = append(db.entries[:i], db.entries[i+1:]...)
            return
        }
    }
}

// The main function is where our adventure begins.
func main() {
    // Create a new database
    db := createDatabase()

    // Add some entries to our database
    db.addEntry("Frodo", "Ring Bearer")
    db.addEntry("Samwise", "Loyal Friend")
    db.addEntry("Gandalf", "Wizard")

    // Retrieve and display an entry
    entry := db.getEntry(2)
    if entry != nil {
        fmt.Printf("Retrieved Entry: ID=%d, Name=%s, Value=%s\n", entry.ID, entry.Name, entry.Value)
    } else {
        fmt.Println("Entry not found")
    }

    // Delete an entry
    db.deleteEntry(1)

    // Try to retrieve the deleted entry
    entry = db.getEntry(1)
    if entry != nil {
        fmt.Printf("Retrieved Entry: ID=%d, Name=%s, Value=%s\n", entry.ID, entry.Name, entry.Value)
    } else {
        fmt.Println("Entry not found")
    }
}

