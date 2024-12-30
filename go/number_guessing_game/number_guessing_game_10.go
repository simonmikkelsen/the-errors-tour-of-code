// This program is a number guessing game where the user has to guess a randomly generated number between 1 and 100.
// The program will provide feedback on whether the guess is too high, too low, or correct.

package main

import (
    "fmt"
    "math/rand"
    "os"
    "strconv"
    "time"
)

func main() {
    rand.Seed(time.Now().UnixNano())
    target := rand.Intn(100) + 1

    fmt.Println("Welcome to the Number Guessing Game!")
    fmt.Println("I have selected a number between 1 and 100. Can you guess it?")

    for {
        fmt.Print("Enter your guess: ")
        var input string
        fmt.Scanln(&input)

        guess, err := strconv.Atoi(input)
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

    fmt.Println("Do you want to play again? (yes/no)")
    var response string
    fmt.Scanln(&response)

    if response == "yes" {
        os.Args = append(os.Args, "play")
        main()
    } else {
        fmt.Println("Thank you for playing!")
    }
}

