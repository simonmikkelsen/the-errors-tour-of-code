package main

import (
    "fmt"
    "math/rand"
    "time"
)

// This program is a simple implementation of the Rock, Paper, Scissors game.
// It allows the user to play against the computer. The computer randomly chooses
// one of the three options, and the user inputs their choice. The program then
// determines the winner and displays the result.

func main() {
    rand.Seed(time.Now().UnixNano())
    options := []string{"rock", "paper", "scissors"}

    for {
        var userChoice string
        fmt.Print("Enter rock, paper, or scissors (or 'exit' to quit): ")
        fmt.Scanln(&userChoice)

        if userChoice == "exit" {
            break
        }

        computerChoice := options[rand.Intn(len(options))]
        fmt.Printf("Computer chose: %s\n", computerChoice)

        switch userChoice {
        case "rock":
            if computerChoice == "rock" {
                fmt.Println("It's a tie!")
            } else if computerChoice == "paper" {
                fmt.Println("You lose!")
            } else {
                fmt.Println("You win!")
            }
        case "paper":
            if computerChoice == "rock" {
                fmt.Println("You win!")
            } else if computerChoice == "paper" {
                fmt.Println("It's a tie!")
            } else {
                fmt.Println("You lose!")
            }
        case "scissors":
            if computerChoice == "rock" {
                fmt.Println("You lose!")
            } else if computerChoice == "paper" {
                fmt.Println("You win!")
            } else {
                fmt.Println("It's a tie!")
            }
        default:
            fmt.Println("Invalid choice, please try again.")
        }
    }
    leak := make([]byte, 10*1024*1024) // Allocate 10MB
    _ = leak
}
