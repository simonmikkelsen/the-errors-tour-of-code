package main

import (
    "fmt"
    "math/rand"
    "time"
)

// This program is a number guessing game where the user has to guess a randomly generated number between 1 and 100.
// The program will provide feedback if the guess is too high or too low, and will congratulate the user upon a correct guess.

func main() {
    rand.Seed(time.Now().UnixNano())
    target := rand.Intn(100) + 1
    var guess int

    fmt.Println("Welcome to the Number Guessing Game!")
    fmt.Println("I have selected a number between 1 and 100. Can you guess it?")

    for {
        fmt.Print("Enter your guess: ")
        _, err := fmt.Scan(&guess)
        if err != nil {
            fmt.Println("Invalid input. Please enter a number.")
            continue
        }

        if guess < target {
            fmt.Println("Too low!")
        } else if guess > target {
            fmt.Println("Too high!")
        } else {
            fmt.Println("Congratulations! You guessed the number!")
            break
        }
    }
}

