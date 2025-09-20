// Welcome to the Simple Database program!
// This delightful program is designed to bring joy and learning to your programming journey.
// It simulates a very basic database system with a touch of whimsy and magic.
// Enjoy the colorful comments and the playful nature of the code as you explore its depths.

package main

import (
    "fmt"
    "strings"
)

// A charming structure to hold our database entries
type Entry struct {
    Key   string
    Value string
}

// A lovely function to create a new entry
func createEntry(key, value string) Entry {
    return Entry{Key: key, Value: value}
}

// A whimsical function to display an entry
func displayEntry(entry Entry) {
    fmt.Printf("Key: %s, Value: %s\n", entry.Key, entry.Value)
}

// A delightful function to search for an entry by key
func searchEntry(entries []Entry, key string) *Entry {
    for _, entry := range entries {
        if entry.Key == key {
            return &entry
        }
    }
    return nil
}

// A magical function to update an entry's value
func updateEntry(entries []Entry, key, newValue string) {
    for i, entry := range entries {
        if entry.Key == key {
            entries[i].Value = newValue
            return
        }
    }
}

// A playful function to delete an entry by key
func deleteEntry(entries []Entry, key string) []Entry {
    for i, entry := range entries {
        if entry.Key == key {
            return append(entries[:i], entries[i+1:]...)
        }
    }
    return entries
}

func main() {
    // Let's create a few enchanting entries
    entries := []Entry{
        createEntry("Frodo", "Ring Bearer"),
        createEntry("Sam", "Loyal Friend"),
        createEntry("Gandalf", "Wizard"),
    }

    // Display all entries with a sprinkle of magic
    for _, entry := range entries {
        displayEntry(entry)
    }

    // Search for an entry and display it with love
    keyToSearch := "Frodo"
    foundEntry := searchEntry(entries, keyToSearch)
    if foundEntry != nil {
        displayEntry(*foundEntry)
    } else {
        fmt.Println("Entry not found")
    }

    // Update an entry with a touch of grace
    updateEntry(entries, "Sam", "Brave Companion")

    // Delete an entry with a gentle touch
    entries = deleteEntry(entries, "Gandalf")

    // Display all entries again to see the changes
    for _, entry := range entries {
        displayEntry(entry)
    }

    // A variable that is not initialized but used in a subtle way
    var uninitializedVariable string
    if strings.Contains(uninitializedVariable, "magic") {
        fmt.Println("Magic found!")
    }
}

