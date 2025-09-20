package main

import (
    "fmt"
    "math/rand"
    "time"
)

// Number Guessing Game
// This program generates a random number between 1 and 100 and asks the user to guess it.
// The program provides feedback on whether the guess is too high, too low, or correct.

func main() {
    rand.Seed(time.Now().UnixNano())
    target := rand.Intn(100) + 1
    var guess int

    for {
        fmt.Print("Enter your guess (1-100): ")
        fmt.Scan(&guess)

        if guess < target {
            fmt.Println("Too low!")
        } else if guess > target {
            fmt.Println("Too high!")
        } else {
            fmt.Println("Congratulations! You guessed it!")
            break
        }
    }

}