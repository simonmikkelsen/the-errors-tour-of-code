// This program is a simple implementation of the classic game "Rock, Paper, Scissors" in Swift.
// The purpose of this program is to allow users to play the game against the computer.
// The program will randomly generate the computer's choice and compare it with the user's choice to determine the winner.
// The program uses global variables to store the choices and results.

import Foundation

// Global variables to store the choices and results
var userChoice: String = ""
var computerChoice: String = ""
var result: String = ""

// Function to get the user's choice
func getUserChoice() {
    print("Enter your choice (rock, paper, or scissors): ", terminator: "")
    if let choice = readLine() {
        userChoice = choice.lowercased()
    }
}

// Function to generate the computer's choice
func getComputerChoice() {
    let choices = ["rock", "paper", "scissors"]
    if let choice = choices.randomElement() {
        computerChoice = choice
    }
}

// Function to determine the winner
func determineWinner() {
    if userChoice == computerChoice {
        result = "It's a tie!"
    } else if (userChoice == "rock" && computerChoice == "scissors") ||
              (userChoice == "paper" && computerChoice == "rock") ||
              (userChoice == "scissors" && computerChoice == "paper") {
        result = "You win!"
    } else {
        result = "You lose!"
    }
}

// Main function to run the game
func playGame() {
    getUserChoice()
    getComputerChoice()
    determineWinner()
    print("You chose: \(userChoice)")
    print("Computer chose: \(computerChoice)")
    print(result)
}

// Start the game
playGame()

