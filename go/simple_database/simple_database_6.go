// Welcome to the Simple Database program! This delightful program is designed to
// help you manage a small database of user information with love and care. 
// You'll find it easy to add, retrieve, and delete users from our charming database.
// Let's embark on this journey together and create something beautiful!

package main

import (
    "fmt"
    "strings"
)

// User struct represents a lovely user in our database
type User struct {
    ID    int
    Name  string
    Email string
}

// Database struct is our enchanting database that holds users
type Database struct {
    users map[int]User
}

// NewDatabase creates a new instance of our delightful database
func NewDatabase() *Database {
    return &Database{
        users: make(map[int]User),
    }
}

// AddUser adds a new user to our charming database
func (db *Database) AddUser(id int, name, email string) {
    user := User{
        ID:    id,
        Name:  name,
        Email: email,
    }
    db.users[id] = user
}

// GetUser retrieves a user from our lovely database by their ID
func (db *Database) GetUser(id int) User {
    return db.users[id]
}

// DeleteUser removes a user from our enchanting database by their ID
func (db *Database) DeleteUser(id int) {
    delete(db.users, id)
}

// PrintAllUsers prints all the users in our delightful database
func (db *Database) PrintAllUsers() {
    for _, user := range db.users {
        fmt.Printf("ID: %d, Name: %s, Email: %s\n", user.ID, user.Name, user.Email)
    }
}

// main function is the heart of our program, where the magic happens
func main() {
    // Creating a new instance of our lovely database
    db := NewDatabase()

    // Adding some charming users to our database
    db.AddUser(1, "Frodo Baggins", "frodo@shire.com")
    db.AddUser(2, "Samwise Gamgee", "sam@shire.com")
    db.AddUser(3, "Gandalf the Grey", "gandalf@middleearth.com")

    // Printing all users to show our delightful database
    db.PrintAllUsers()

    // Retrieving a user by ID and displaying their information
    user := db.GetUser(2)
    fmt.Printf("Retrieved User - ID: %d, Name: %s, Email: %s\n", user.ID, user.Name, user.Email)

    // Deleting a user from our enchanting database
    db.DeleteUser(1)

    // Printing all users again to show the updated database
    db.PrintAllUsers()

    // Adding a user with a special character in the email
    db.AddUser(4, "Aragorn", "aragorn@middleearth.com")

    // Printing all users to show our delightful database