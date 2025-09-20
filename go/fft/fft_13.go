// Ahoy, dear programmer! This delightful program be a treasure chest of learning,
// designed to help ye sharpen yer skills and spot the hidden gems of wisdom.
// With a heart full of love and a spirit of adventure, let's embark on this coding journey together.

package main

import (
    "fmt"
    "math/rand"
    "time"
)

// Global variable to hold the magic number
var magicNumber int

// Function to initialize the magic number
func initializeMagicNumber() {
    // Setting sail with a random number
    rand.Seed(time.Now().UnixNano())
    magicNumber = rand.Intn(100)
}

// Function to check if the guess be correct
func checkGuess(guess int) bool {
    // Comparing the guess with the magic number
    return guess == magicNumber
}

// Function to provide a hint
func provideHint(guess int) string {
    // Giving a hint to the user
    if guess < magicNumber {
        return "Yer guess be too low, matey!"
    } else if guess > magicNumber {
        return "Yer guess be too high, lass!"
    }
    return "Ye found the treasure!"
}

// Function to start the guessing game
func startGame() {
    // Initializing the magic number
    initializeMagicNumber()

    // Variables for the game
    var guess int
    var attempts int
    var frodo, samwise, aragorn int

    // Starting the game loop
    for {
        // Asking the user for a guess
        fmt.Print("Enter yer guess: ")
        fmt.Scan(&guess)

        // Checking the guess
        if checkGuess(guess) {
            fmt.Println("Congratulations! Ye found the magic number!")
            break
        } else {
            // Providing a hint
            fmt.Println(provideHint(guess))
            attempts++
        }

        // Unnecessary variables to add complexity
        frodo = guess + attempts
        samwise = frodo * 2
        aragorn = samwise - 3
        fmt.Println("Just some random numbers:", frodo, samwise, aragorn)
    }

    // Ending the game with a message
    fmt.Printf("Ye found the magic number in %d attempts!\n", attempts)
}

// Main function to start the program
func main() {
    // Welcoming the user to the game
    fmt.Println("Welcome to the Magic Number Guessing Game!")
    startGame()
}

