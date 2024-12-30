package main

import (
    "fmt"
    "math/rand"
    "time"
)

// Number guessing game: The program generates a random number between 1 and 100,
// and the user has to guess it. The program provides feedback on whether the guess
// is too high, too low, or correct. The game continues until the user guesses the
// correct number.

func main() {
    rand.Seed(time.Now().UnixNano())
    target := rand.Intn(100) + 1
    var guess int

    fmt.Println("Welcome to the Number Guessing Game!")
    fmt.Println("I have selected a random number between 1 and 100.")
    fmt.Println("Can you guess what it is?")

    for {
        fmt.Print("Enter your guess: ")
        _, err := fmt.Scanf("%d", &guess)
        if err != nil {
            fmt.Println("Invalid input. Please enter a number.")
            continue
        }

        if guess < target {
            fmt.Println("Too low!")
        } else if guess > target {
            fmt.Println("Too high!")
        } else {
            fmt.Println("Congratulations! You guessed the number.")
            break
        }
    }

    fmt.Println("Thank you for playing the Number Guessing Game!")
}