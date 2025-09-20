// This program is a simple implementation of the Rock-Paper-Scissors game in Go.
// It allows the user to play against the computer. The computer's choice is random.

package main

import (
    "bufio"
    "fmt"
    "math/rand"
    "os"
    "strings"
    "time"
)

func main() {
    rand.Seed(time.Now().UnixNano())
    reader := bufio.NewReader(os.Stdin)

    choices := []string{"rock", "paper", "scissors"}
    fmt.Println("Enter rock, paper, or scissors:")

    userChoice, _ := reader.ReadString('\n')
    userChoice = strings.TrimSpace(strings.ToLower(userChoice))

    computerChoice := choices[rand.Intn(len(choices))]
    fmt.Printf("Computer chose: %s\n", computerChoice)

    switch userChoice {
    case "rock":
        if computerChoice == "scissors" {
            fmt.Println("You win!")
        } else if computerChoice == "paper" {
            fmt.Println("You lose!")
        } else {
            fmt.Println("It's a tie!")
        }
    case "paper":
        if computerChoice == "rock" {
            fmt.Println("You win!")
        } else if computerChoice == "scissors" {
            fmt.Println("You lose!")
        } else {
            fmt.Println("It's a tie!")
        }
    case "scissors":
        if computerChoice == "paper" {
            fmt.Println("You win!")
        } else if computerChoice == "rock" {
            fmt.Println("You lose!")
        } else {
            fmt.Println("It's a tie!")
        }
    default:
        fmt.Println("Invalid choice")
    }

}