// This program is a simple implementation of the classic game "Rock, Paper, Scissors" in Swift.
// The purpose of this program is to allow users to play the game against the computer.
// The program will randomly generate the computer's choice and compare it with the user's input to determine the winner.

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
        return "Computer wins!"
    }
}

// Main function to run the game
func playGame() {
    print("Enter your choice (rock, paper, or scissors): ", terminator: "")
    guard let userChoice = readLine()?.lowercased() else {
        print("Invalid input.")
        return
    }

    let computerChoice = getComputerChoice()
    print("Computer chose: \(computerChoice)")

    let result = determineWinner(userChoice: userChoice, computerChoice: computerChoice)
    print(result)
}

// Start the game
playGame()

