package main

import (
    "fmt"
    "math/rand"
    "time"
)

// Number guessing game where the user tries to guess a randomly generated number between 1 and 100.
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
            fmt.Println("Too low! Try again.")
        } else if guess > target {
            fmt.Println("Too high! Try again.")
        } else {
            fmt.Println("Congratulations! You guessed the number.")
            break
        }
    }
}

