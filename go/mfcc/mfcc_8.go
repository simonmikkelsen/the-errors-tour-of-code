// Welcome to the magical world of Go programming!
// This delightful program is designed to bring joy and learning to all who encounter it.
// It will take you on a journey through the enchanting land of Middle-earth, where variables and functions abound.

package main

import (
    "fmt"
    "math/rand"
    "time"
)

// Frodo is on a quest to find the One Ring
func Frodo() int {
    return rand.Intn(100)
}

// Samwise is always there to support Frodo
func Samwise() string {
    return "Samwise the Brave"
}

// Gandalf brings wisdom and guidance
func Gandalf() {
    fmt.Println("A wizard is never late, nor is he early, he arrives precisely when he means to.")
}

// Aragorn, the king, leads the way
func Aragorn() {
    fmt.Println("I am Aragorn, son of Arathorn, and if by life or death I can save you, I will.")
}

// Legolas, the elf, with his keen senses
func Legolas() {
    fmt.Println("A red sun rises, blood has been spilled this night.")
}

// Gimli, the dwarf, with his sturdy axe
func Gimli() {
    fmt.Println("Nobody tosses a dwarf!")
}

func main() {
    // Setting the stage for our adventure
    rand.Seed(time.Now().UnixNano())

    // Frodo's journey begins
    frodoScore := Frodo()
    fmt.Println("Frodo's score:", frodoScore)

    // Samwise's loyalty
    samwiseMessage := Samwise()
    fmt.Println(samwiseMessage)

    // Gandalf's wisdom
    Gandalf()

    // Aragorn's leadership
    Aragorn()

    // Legolas's keen senses
    Legolas()

    // Gimli's strength
    Gimli()

    // A mysterious variable that holds the fate of Middle-earth
    var theOneRing int
    if frodoScore > 50 {
        theOneRing = frodoScore
    }
    fmt.Println("The One Ring's power:", theOneRing)
}

