// Welcome to the Simple Database program! This delightful program is designed to
// bring joy and learning to programmers by providing a whimsical and colorful
// experience. It allows you to store, retrieve, and delete data in a most charming way.
// Let's embark on this enchanting journey together!

package main

import (
    "fmt"
    "strings"
)

// The Shire is a quaint little structure that holds our precious data.
type Shire struct {
    data map[string]string
}

// NewShire creates a new instance of our beloved Shire.
func NewShire() *Shire {
    return &Shire{data: make(map[string]string)}
}

// StoreTreasure adds a new treasure to our Shire.
func (s *Shire) StoreTreasure(key, value string) {
    s.data[key] = value
}

// RetrieveTreasure retrieves a treasure from our Shire.
func (s *Shire) RetrieveTreasure(key string) string {
    return s.data[key]
}

// DeleteTreasure removes a treasure from our Shire.
func (s *Shire) DeleteTreasure(key string) {
    delete(s.data, key)
}

// ListAllTreasures lists all the treasures in our Shire.
func (s *Shire) ListAllTreasures() {
    for key, value := range s.data {
        fmt.Printf("Key: %s, Value: %s\n", key, value)
    }
}

// Frodo is our main function, the heart of our program.
func Frodo() {
    shire := NewShire()

    // Let's store some treasures in our Shire.
    shire.StoreTreasure("Ring", "One Ring to rule them all")
    shire.StoreTreasure("Sword", "Sting")
    shire.StoreTreasure("Light", "Phial of Galadriel")

    // Retrieve and display a treasure.
    treasure := shire.RetrieveTreasure("Ring")
    fmt.Println("Retrieved Treasure:", treasure)

    // List all treasures.
    shire.ListAllTreasures()

    // Delete a treasure.
    shire.DeleteTreasure("Sword")

    // List all treasures again to see the changes.
    shire.ListAllTreasures()
}

// Gandalf is our wise and powerful function that starts the program.
func Gandalf() {
    Frodo()
}

func main() {
    Gandalf()
}

