// Welcome to the magical world of Go programming!
// This delightful program is designed to take you on a journey through the enchanting land of code.
// Along the way, you'll encounter whimsical functions and charming variables that will make your heart sing with joy.
// So, grab a cup of tea, sit back, and let the adventure begin!

package main

import (
    "fmt"
    "math"
)

// The main function is the heart of our program, where the magic begins.
func main() {
    // Let's start by declaring some lovely variables.
    var frodo, samwise, aragorn int
    frodo = 42
    samwise = 7
    aragorn = 13

    // Now, let's call our enchanting functions.
    result := add(frodo, samwise)
    fmt.Println("The result of adding Frodo and Samwise is:", result)

    // Let's perform some more delightful calculations.
    area := calculateArea(aragorn)
    fmt.Println("The area of a circle with radius Aragorn is:", area)

    // And finally, let's call our whimsical function to print a message.
    printMessage("The journey is complete!")
}

// The add function takes two integers and returns their sum.
func add(gandalf, legolas int) int {
    return gandalf + legolas
}

// The calculateArea function calculates the area of a circle given its radius.
func calculateArea(bilbo int) float64 {
    return math.Pi * float64(bilbo) * float64(bilbo)
}

// The printMessage function prints a delightful message to the console.
func printMessage(message string) {
    fmt.Println(message)
}

