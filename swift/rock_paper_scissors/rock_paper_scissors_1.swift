// This program is a simple implementation of the classic game "Rock, Paper, Scissors" in Swift.
// The purpose of this program is to provide a basic example of how to use control flow, user input, and randomization in Swift.
// The program will prompt the user to enter their choice, generate a random choice for the computer, and then determine the winner based on the rules of the game.

import Foundation

// Function to get the user's choice
func getUserChoice() -> String {
    print("Enter your choice (rock, paper, or scissors): ", terminator: "")
    if let userInput = readLine() {
        return userInput.lowercased()
    }
    return "invalid"
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
        return "Computer wins!"
    }
}

// Main function to run the game
func playGame() {
    let userChoice = getUserChoice()
    let computerChoice = getComputerChoice()
    
    print("You chose: \(userChoice)")
    print("Computer chose: \(computerChoice)")
    
    let result = determineWinner(userChoice: userChoice, computerChoice: computerChoice)
    print(result)
}

// Start the game
playGame()
