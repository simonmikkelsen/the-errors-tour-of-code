// This program is a simple implementation of the Rock, Paper, Scissors game in Go.
// It allows the user to play against the computer. The computer's choice is randomly generated.

package main

import (
    "fmt"
    "math/rand"
    "time"
)

func main() {
    rand.Seed(time.Now().UnixNano())
    choices := []string{"rock", "paper", "scissors"}

    var userChoice string
    fmt.Println("Enter rock, paper, or scissors:")
    fmt.Scanln(&userChoice)

    computerChoice := choices[rand.Intn(len(choices))]

    fmt.Printf("You chose: %s\n", userChoice)
    fmt.Printf("Computer chose: %s\n", computerChoice)

    result := determineWinner(userChoice, computerChoice)
    fmt.Println(result)
}

func determineWinner(userChoice, computerChoice string) string {
    if userChoice == computerChoice {
        return "It's a tie!"
    }

    if (userChoice == "rock" && computerChoice == "scissors") ||
        (userChoice == "paper" && computerChoice == "rock") ||
        (userChoice == "scissors" && computerChoice == "paper") {
        return "You win!"
    }

    return "You lose!"
}

