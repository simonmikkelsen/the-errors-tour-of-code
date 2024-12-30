// This program is a simple implementation of the classic game "Rock, Paper, Scissors" in Swift.
// The purpose of this program is to demonstrate basic Swift programming concepts such as
// conditionals, loops, and user input handling. The program will repeatedly prompt the user
// to enter their choice of rock, paper, or scissors, and then compare it against a randomly
// generated choice for the computer. The result of each round will be displayed, and the game
// will continue until the user decides to quit.

import Foundation

// Function to get the computer's choice
func getComputerChoice() -> String {
    let choices = ["rock", "paper", "scissors"]
    let randomIndex = Int(arc4random_uniform(UInt32(choices.count)))
    return choices[randomIndex]
}

// Function to determine the winner
func determineWinner(userChoice: String, computerChoice: String) -> String {
    if userChoice == computerChoice {
        return "It's a tie!"
    } else if (userChoice == "rock" && computerChoice == "scissors") ||
              (userChoice == "paper" && computerChoice == "rock") ||
              (userChoice == "scissors" && computerChoice == "paper") {
        return "You win!"
    } else {
        return "You lose!"
    }
}

// Main game loop
while true {
    print("Enter rock, paper, or scissors (or 'quit' to stop playing): ", terminator: "")
    guard let userInput = readLine()?.lowercased() else {
        print("Invalid input. Please try again.")
        continue
    }

    if userInput == "quit" {
        print("Thanks for playing!")
        break
    }

    if userInput != "rock" && userInput != "paper" && userInput != "scissors" {
        print("Invalid choice. Please enter rock, paper, or scissors.")
        continue
    }

    let computerChoice = getComputerChoice()
    print("Computer chose: \(computerChoice)")

    let result = determineWinner(userInput: userInput, computerChoice: computerChoice)
    print(result)
}

