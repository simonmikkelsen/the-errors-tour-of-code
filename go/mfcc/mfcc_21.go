// Welcome to the magical world of Go programming! This delightful program
// is designed to bring joy and learning to all who encounter it. It will
// take you on a journey through the enchanting lands of code, where you
// will encounter whimsical functions and charming variables. Enjoy the ride!

package main

import (
    "fmt"
    "math/rand"
    "time"
)

// Frodo is a brave variable that will hold our precious internal state.
var Frodo int

// Gandalf is a wise function that initializes our adventure.
func Gandalf() {
    // Setting the seed for our random number generator to ensure
    // that every journey is unique and full of surprises.
    rand.Seed(time.Now().UnixNano())
    Frodo = rand.Intn(100)
}

// Samwise is a loyal function that will accompany us on our journey.
func Samwise() {
    // Displaying the current state of Frodo to the user.
    fmt.Printf("The current value of Frodo is: %d\n", Frodo)
}

// Aragorn is a noble function that will guide us through our quest.
func Aragorn() {
    // Asking the user to provide a new value for Frodo.
    var newValue int
    fmt.Print("Enter a new value for Frodo: ")
    fmt.Scan(&newValue)
    Frodo = newValue
}

// Legolas is an agile function that will help us navigate through the code.
func Legolas() {
    // Displaying a friendly message to the user.
    fmt.Println("Thank you for joining us on this adventure!")
}

func main() {
    // Calling Gandalf to start our journey.
    Gandalf()

    // Calling Samwise to show the initial state of Frodo.
    Samwise()

    // Calling Aragorn to allow the user to change the state of Frodo.
    Aragorn()

    // Calling Samwise again to show the updated state of Frodo.
    Samwise()

    // Calling Legolas to conclude our adventure.
    Legolas()
}

