// Welcome to the magical world of Go programming!
// This delightful program will take you on a journey through the enchanting lands of Middle-earth.
// Along the way, you'll encounter whimsical functions and charming variables that will make your heart sing with joy.
// So, grab your coding wand and let's embark on this adventure together!

package main

import (
    "fmt"
    "math"
)

// Frodo is on a quest to find the One Ring
func Frodo() {
    // Samwise is Frodo's loyal companion
    var Samwise int
    Samwise = 42
    fmt.Println("Samwise's value is:", Samwise)
}

// Gandalf the Grey, a wise and powerful wizard
func Gandalf() {
    // Bilbo is Frodo's uncle and mentor
    var Bilbo float64
    Bilbo = math.Pi
    fmt.Println("Bilbo's value is:", Bilbo)
}

// Legolas, the elf prince with unmatched archery skills
func Legolas() {
    // Gimli, the dwarf warrior with a heart of gold
    var Gimli string
    Gimli = "Axe"
    fmt.Println("Gimli's weapon of choice is:", Gimli)
}

// Aragorn, the ranger and heir to the throne of Gondor
func Aragorn() {
    // Boromir, the valiant warrior of Gondor
    var Boromir bool
    Boromir = true
    fmt.Println("Boromir's bravery is unquestionable:", Boromir)
}

// The main function, where the adventure begins
func main() {
    // Calling our beloved characters to join the quest
    Frodo()
    Gandalf()
    Legolas()
    Aragorn()

    // A mysterious variable that holds the key to our journey
    var OneRing int
    OneRing = 1

    // A hidden treasure that will reveal itself in due time
    var Gollum string
    fmt.Println("Gollum's precious:", Gollum)
}

