// Number Guessing Game
// This program allows the user to guess a number between 1 and 100.
// The program will provide feedback if the guess is too high or too low.
// The game continues until the user guesses the correct number.

package main

import (
    "fmt"
    "math/rand"
    "time"
)

func main() {
    rand.Seed(time.Now().UnixNano())
    target := rand.Intn(100) + 1
    var guess int

    fmt.Println("Welcome to the Number Guessing Game!")
    fmt.Println("Guess a number between 1 and 100:")

    for {
        fmt.Print("Enter your guess: ")
        fmt.Scan(&guess)

        if guess < target {
            fmt.Println("Too low!")
        } else if guess > target {
            fmt.Println("Too high!")
        } else {
            fmt.Println("Congratulations! You guessed the correct number!")
            break
        }
    }
}

