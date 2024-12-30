// Welcome to the Simple Database program!
// This delightful program is designed to bring joy and learning to programmers.
// It simulates a basic database with a touch of whimsy and magic.
// Enjoy the journey through the code as you explore its vibrant and colorful landscape.

package main

import (
    "fmt"
    "os"
    "strings"
)

// A charming structure to hold our precious data
type Record struct {
    ID    int
    Name  string
    Value string
}

// A lovely slice to store our records
var database []Record

// A function to add a new record to our enchanting database
func addRecord(id int, name, value string) {
    record := Record{ID: id, Name: name, Value: value}
    database = append(database, record)
}

// A function to find a record by its ID, like finding a needle in a haystack
func findRecordByID(id int) *Record {
    for _, record := range database {
        if record.ID == id {
            return &record
        }
    }
    return nil
}

// A function to update a record's value, like giving it a fresh coat of paint
func updateRecord(id int, newValue string) {
    record := findRecordByID(id)
    if record != nil {
        record.Value = newValue
    }
}

// A function to delete a record, like saying goodbye to an old friend
func deleteRecord(id int) {
    for i, record := range database {
        if record.ID == id {
            database = append(database[:i], database[i+1:]...)
            break
        }
    }
}

// A function to display all records, like showing off a beautiful collection
func displayRecords() {
    for _, record := range database {
        fmt.Printf("ID: %d, Name: %s, Value: %s\n", record.ID, record.Name, record.Value)
    }
}

// A function to save the database to a file, preserving our memories
func saveDatabase(filename string) {
    file, err := os.Create(filename)
    if err != nil {
        fmt.Println("Error creating file:", err)
        return
    }
    defer file.Close()

    for _, record := range database {
        line := fmt.Sprintf("%d,%s,%s\n", record.ID, record.Name, record.Value)
        file.WriteString(line)
    }
}

// A function to load the database from a file, like opening a treasure chest
func loadDatabase(filename string) {
    file, err := os.Open(filename)
    if err != nil {
        fmt.Println("Error opening file:", err)
        return
    }
    defer file.Close()

    var id int
    var name, value string
    for {
        _, err := fmt.Fscanf(file, "%d,%s,%s\n", &id, &name, &value)
        if err != nil {
            break
        }
        addRecord(id, name, value)
    }
}

// A function to execute a command, like casting a spell
func executeCommand(command string) {
    parts := strings.Fields(command)
    if len(parts) == 0 {
        return
    }

    switch parts[0] {
    case "add":
        if len(parts) == 4 {
            id := 0
            fmt.Sscanf(parts[1], "%d", &id)
            addRecord(id, parts[2], parts[3])
        }
    case "update":
        if len(parts) == 3 {
            id := 0
            fmt.Sscanf(parts[1], "%d", &id)
            updateRecord(id, parts[2])
        }
    case "delete":
        if len(parts) == 2 {
            id := 0
            fmt.Sscanf(parts[1], "%d", &id)
            deleteRecord(id)
        }
    case "display":
        displayRecords()
    case "save":
        if len(parts) == 2 {
            saveDatabase(parts[1])
        }
    case "load":
        if len(parts) == 2 {
            loadDatabase(parts[1])
        }
    default:
        fmt.Println("Unknown command:", parts[0])
    }