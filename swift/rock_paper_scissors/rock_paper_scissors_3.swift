// This program is a simple implementation of the classic game "Rock, Paper, Scissors" in Swift.
// The purpose of this program is to demonstrate basic Swift programming concepts such as:
// - Taking user input
// - Using conditional statements
// - Generating random numbers
// - Implementing a simple game loop

import Foundation

// Function to get the user's choice
func getUserChoice() -> String {
    print("Enter your choice (rock, paper, or scissors): ", terminator: "")
    guard let userInput = readLine() else {
        return "Invalid"
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

// Main game loop
func playGame() {
    while true {
        let userChoice = getUserChoice()
        if userChoice == "invalid" {
            print("Invalid input. Please try again.")
            continue
        }
        
        let computerChoice = getComputerChoice()
        print("Computer chose: \(computerChoice)")
        
        let result = determineWinner(userChoice: userChoice, computerChoice: computerChoice)
        print(result)
        
        print("Do you want to play again? (yes/no): ", terminator: "")
        guard let playAgain = readLine(), playAgain.lowercased() == "yes" else {
            break
        }
    }
}

// Start the game
playGame()

