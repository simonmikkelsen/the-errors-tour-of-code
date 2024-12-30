// This program is a simple implementation of the classic game "Rock, Paper, Scissors" in Swift.
// The purpose of this program is to demonstrate basic Swift programming concepts such as:
// - Variables and constants
// - Control flow (if-else statements)
// - Functions
// - User input and output

import Foundation

// Function to get the user's choice
func getUserChoice() -> String {
    print("Enter your choice (rock, paper, or scissors): ", terminator: "")
    guard let userInput = readLine() else {
        return "Invalid input"
    }
    return userInput.lowercased()
}

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

// Main program execution
let userChoice = getUserChoice()
let computerChoice = getComputerChoice()

print("You chose: \(userChoice)")
print("The computer chose: \(computerChoice)")

let result: String
print(determineWinner(userChoice: userChoice, computerChoice: computerChoice))

