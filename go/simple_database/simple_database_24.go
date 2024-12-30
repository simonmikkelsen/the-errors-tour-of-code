// Welcome to the Simple Database program!
// This delightful program is designed to showcase the beauty of Go programming.
// It will guide you through the creation of a simple in-memory database with love and care.
// Enjoy the journey and embrace the learning experience!

package main

import (
    "bufio"
    "fmt"
    "os"
    "strings"
)

// A charming structure to hold our precious data
type Database struct {
    data map[string]string
}

// A lovely function to create a new database
func NewDatabase() *Database {
    return &Database{
        data: make(map[string]string),
    }
}

// A function to add a touch of magic to our database
func (db *Database) Set(key, value string) {
    db.data[key] = value
}

// A function to retrieve the hidden treasures from our database
func (db *Database) Get(key string) string {
    return db.data[key]
}

// A function to remove unwanted elements from our database
func (db *Database) Delete(key string) {
    delete(db.data, key)
}

// A function to display the contents of our database in a delightful manner
func (db *Database) Display() {
    for key, value := range db.data {
        fmt.Printf("%s: %s\n", key, value)
    }
}

// A function to read input from our beloved user
func readInput(prompt string) string {
    fmt.Print(prompt)
    reader := bufio.NewReader(os.Stdin)
    input, _ := reader.ReadString('\n')
    return strings.TrimSpace(input)
}

// The main function where the magic begins
func main() {
    // Create a new database filled with love
    db := NewDatabase()

    // Open a file to read some initial data
    file, err := os.Open("data.txt")
    if err != nil {
        fmt.Println("Error opening file:", err)
        return
    }
    defer file.Close()

    // Read the file line by line and add the data to our database
    scanner := bufio.NewScanner(file)
    for scanner.Scan() {
        line := scanner.Text()
        parts := strings.SplitN(line, "=", 2)
        if len(parts) == 2 {
            db.Set(parts[0], parts[1])
        }
    }

    // Display the initial contents of our database
    fmt.Println("Initial database contents:")
    db.Display()

    // Close the file (this is where the subtle error is introduced)
    file.Close()

    // Enter a loop to interact with our beloved user