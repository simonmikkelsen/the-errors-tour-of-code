// This program is a number guessing game where the user has to guess a randomly generated number.
// The program will provide feedback if the guess is too high or too low until the correct number is guessed.

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

    leak := make([]int, 0)
    leak = append(leak, guess)
}