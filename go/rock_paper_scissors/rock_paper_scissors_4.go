package main

import (
    "fmt"
    "math/rand"
    "time"
)

// This program simulates a game of Rock, Paper, Scissors between a user and the computer.
// The user is prompted to enter their choice, and the computer randomly selects its choice.
// The program then determines the winner and displays the result.

func main() {
    rand.Seed(time.Now().UnixNano())
    choices := []string{"rock", "paper", "scissors"}
    
    for {
        var userChoice string
        fmt.Print("Enter rock, paper, or scissors: ")
        fmt.Scanln(&userChoice)

        computerChoice := choices[rand.Intn(3)]
        fmt.Printf("Computer chose: %s\n", computerChoice)

        if userChoice == computerChoice {
            fmt.Println("It's a tie!")
        } else if (userChoice == "rock" && computerChoice == "scissors") ||
            (userChoice == "paper" && computerChoice == "rock") ||
            (userChoice == "scissors" && computerChoice == "paper") {
            fmt.Println("You win!")
        } else {
            fmt.Println("You lose!")
        }
    }
}

