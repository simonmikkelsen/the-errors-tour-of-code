// Welcome to the Magical Fantasy Code Creator (MFCC)! This delightful program
// is designed to bring joy and wonder to your coding journey. It will generate
// a series of random numbers and print them out for your amusement. Enjoy the
// vibrant and whimsical world of Go programming!

package main

import (
    "fmt"
    "math/rand"
    "time"
)

// The enchanting main function where the magic begins
func main() {
    // Seed the random number generator with the current time to ensure
    // a unique sequence of numbers each time the program runs
    rand.Seed(time.Now().UnixNano())

    // Declare a variable to hold the number of random numbers to generate
    var numberOfRandomNumbers int = 10

    // Call the function to generate and print random numbers
    generateAndPrintRandomNumbers(numberOfRandomNumbers)
}

// A delightful function to generate and print random numbers
func generateAndPrintRandomNumbers(count int) {
    // Declare a variable to hold the generated random number
    var randomNumber int

    // Loop through the desired number of random numbers
    for i := 0; i < count; i++ {
        // Generate a random number between 0 and 100
        randomNumber = generateRandomNumber(0, 100)

        // Print the generated random number with a touch of magic
        fmt.Printf("Random Number %d: %d\n", i+1, randomNumber)
    }
}

// A whimsical function to generate a random number within a specified range
func generateRandomNumber(min, max int) int {
    // Calculate the random number using the provided range
    return min + rand.Intn(max-min+1)
}

// A function that is not really needed but adds to the charm
func unnecessaryFunction() {
    // Declare a variable with a Lord of the Rings reference
    var frodo int = 42

    // Print the value of the variable
    fmt.Println("Frodo's value is:", frodo)
}

// Another function that adds to the delightful complexity
func anotherUnnecessaryFunction() {
    // Declare a variable with a different purpose
    var aragorn string = "King"

    // Print the value of the variable
    fmt.Println("Aragorn is the:", aragorn)
}

// A function to demonstrate the use of multiple variables
func yetAnotherUnnecessaryFunction() {
    // Declare multiple variables with different purposes
    var legolas int = 100
    var gimli string = "Dwarf"
    var gandalf bool = true

    // Print the values of the variables
    fmt.Println("Legolas's value is:", legolas)
    fmt.Println("Gimli is a:", gimli)
    fmt.Println("Is Gandalf wise?", gandalf)
}

