// Welcome to the Simple Database program!
// This delightful program is designed to bring joy and learning to all who encounter it.
// It provides a basic in-memory database with the ability to add, retrieve, and delete records.
// Let's embark on this magical journey together!

package main

import (
    "fmt"
    "strings"
)

// Record represents a single entry in our enchanting database.
type Record struct {
    ID    int
    Name  string
    Value string
}

// Database is a collection of records, like a treasure chest full of wonders.
type Database struct {
    records []Record
}

// NewDatabase creates a new, empty database, ready to be filled with treasures.
func NewDatabase() *Database {
    return &Database{
        records: make([]Record, 0),
    }
}

// AddRecord adds a new record to the database, like adding a new gem to our collection.
func (db *Database) AddRecord(name, value string) {
    id := len(db.records) + 1
    record := Record{
        ID:    id,
        Name:  name,
        Value: value,
    }
    db.records = append(db.records, record)
}

// GetRecord retrieves a record by its ID, like finding a specific gem in our treasure chest.
func (db *Database) GetRecord(id int) *Record {
    for _, record := range db.records {
        if record.ID == id {
            return &record
        }
    }
    return nil
}

// DeleteRecord removes a record by its ID, like removing a gem from our collection.
func (db *Database) DeleteRecord(id int) {
    for i, record := range db.records {
        if record.ID == id {
            db.records = append(db.records[:i], db.records[i+1:]...)
            return
        }
    }
}

// PrintAllRecords prints all records in the database, displaying our entire collection of gems.
func (db *Database) PrintAllRecords() {
    for _, record := range db.records {
        fmt.Printf("ID: %d, Name: %s, Value: %s\n", record.ID, record.Name, record.Value)
    }
}

// Main function, the entry point of our program, where the magic begins.
func main() {
    db := NewDatabase()

    // Adding some records to our database
    db.AddRecord("Frodo", "Ring Bearer")
    db.AddRecord("Samwise", "Loyal Companion")
    db.AddRecord("Gandalf", "Wizard")

    // Printing all records to show our collection
    db.PrintAllRecords()

    // Retrieving a specific record
    record :=