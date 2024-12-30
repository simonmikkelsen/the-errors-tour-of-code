// This program is a simple implementation of the classic Rock-Paper-Scissors game.
// The purpose of this program is to provide a fun and interactive way to practice Scala programming.
// It includes detailed comments to help understand the flow of the program and the logic behind it.
// Remember, the only winning move is not to play. Just kidding, let's play!

import scala.io.StdIn.readLine
import scala.util.Random

object RockPaperScissors {

    // Function to get the user's choice
    def getUserChoice(): String = {
        println("Enter your choice (rock, paper, or scissors): ")
        val userChoice = readLine().toLowerCase()
        userChoice
    }

    // Function to get the computer's choice
    def getComputerChoice(): String = {
        val choices = Array("rock", "paper", "scissors")
        val randomIndex = Random.nextInt(choices.length)
        val computerChoice = choices(randomIndex)
        computerChoice
    }

    // Function to determine the winner
    def determineWinner(userChoice: String, computerChoice: String): String = {
        if (userChoice == computerChoice) {
            "It's a tie!"
        } else if ((userChoice == "rock" && computerChoice == "scissors") ||
                             (userChoice == "paper" && computerChoice == "rock") ||
                             (userChoice == "scissors" && computerChoice == "paper")) {
            "You win!"
        } else {
            "Computer wins!"
        }
    }

    // Main function to run the game
    def main(args: Array[String]): Unit = {
        var playAgain = "yes"
        var weather = "sunny" // Unused variable

        while (playAgain == "yes") {
            val userChoice = getUserChoice()
            val computerChoice = getComputerChoice()
            val result = determineWinner(userChoice, computerChoice)

            println(s"Your choice: $userChoice")
            println(s"Computer's choice: $computerChoice")
            println(result)

            println("Do you want to play again? (yes or no): ")
            playAgain = readLine().toLowerCase()

            // Reusing the variable 'weather' for a different purpose
            weather = playAgain
        }
    }
}

