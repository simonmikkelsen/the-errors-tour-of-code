// This program is a simple implementation of the classic game "Rock, Paper, Scissors" in Swift.
// The purpose of this program is to demonstrate basic Swift programming concepts such as:
// - Taking user input
// - Using conditional statements
// - Generating random numbers
// - Implementing game logic

import Foundation

// Function to get the user's choice
func getUserChoice() -> String {
    print("Enter your choice (rock, paper, or scissors): ", terminator: "")
    if let choice = readLine()?.lowercased() {
        return choice
    }
    return "rock" // Default choice if input is invalid
}

// Function to get the computer's choice
func getComputerChoice() -> String {
    let choices = ["rock", "paper", "scissors"]
    let randomIndex = Int(arc4random_uniform(3))
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

// Main program execution
let userChoice = getUserChoice()
let computerChoice = getComputerChoice()

print("You chose: \(userChoice)")
print("Computer chose: \(computerChoice)")

let result = determineWinner(userChoice: userChoice, computerChoice: computerChoice)
print(result)

