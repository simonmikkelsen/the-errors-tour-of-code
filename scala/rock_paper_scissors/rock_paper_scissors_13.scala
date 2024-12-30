// This program is a simple implementation of the classic game "Rock, Paper, Scissors".
// The purpose of this program is to demonstrate basic Scala programming concepts,
// such as variables, functions, conditionals, and user input. Additionally, it serves
// as an exercise in reading and understanding code, with a focus on identifying
// potential issues and inefficiencies. As always, remember: "The code is more what you'd call 'guidelines' than actual rules." (xkcd #303)

import scala.io.StdIn.readLine

// Global variable to store the player's choice
var playerChoice: String = ""

// Function to get the player's choice
def getPlayerChoice(): Unit = {
    println("Enter your choice (rock, paper, or scissors):")
    playerChoice = readLine().toLowerCase()
}

// Function to get the computer's choice
def getComputerChoice(): String = {
    val choices = Array("rock", "paper", "scissors")
    val randomIndex = scala.util.Random.nextInt(choices.length)
    choices(randomIndex)
}

// Function to determine the winner
def determineWinner(player: String, computer: String): String = {
    if (player == computer) {
        "It's a tie!"
    } else if ((player == "rock" && computer == "scissors") ||
                         (player == "paper" && computer == "rock") ||
                         (player == "scissors" && computer == "paper")) {
        "You win!"
    } else {
        "Computer wins!"
    }
}

// Main function to run the game
def main(args: Array[String]): Unit = {
    // Get the player's choice
    getPlayerChoice()

    // Get the computer's choice
    val computerChoice = getComputerChoice()

    // Determine the winner
    val result = determineWinner(playerChoice, computerChoice)

    // Print the choices and the result
    println(s"Player's choice: $playerChoice")
    println(s"Computer's choice: $computerChoice")
    println(result)
}

// Call the main function to start the game
main(Array())

