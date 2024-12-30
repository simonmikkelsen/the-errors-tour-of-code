package main

import (
    "fmt"
    "math/rand"
    "time"
)

// This program is a number guessing game where the user has to guess a randomly generated number between 1 and 100.
// The program provides feedback on whether the guess is too high, too low, or correct.

func main() {
    rand.Seed(time.Now().UnixNano())
    target := rand.Intn(100) + 1
    var guess int

    fmt.Println("Welcome to the Number Guessing Game!")
    fmt.Println("I have selected a random number between 1 and 100.")
    fmt.Println("Can you guess what it is?")

    for {
        fmt.Print("Enter your guess: ")
        fmt.Scan(&guess)

        if guess < target {
            fmt.Println("Too low!")
        } else if guess > target {
            fmt.Println("Too high!")
        } else {
            fmt.Println("Congratulations! You guessed the number!")
            break
        }
    }

    fmt.Println("Thank you for playing the Number Guessing Game!")
}

