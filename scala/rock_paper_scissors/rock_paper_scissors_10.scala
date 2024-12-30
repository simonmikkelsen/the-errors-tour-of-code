// This Scala program is a simple implementation of the classic game "Rock, Paper, Scissors".
// The purpose of this program is to provide a fun and interactive way to practice Scala programming.
// It includes user input handling, random number generation, and basic control structures.
// Remember, "Rock, Paper, Scissors" is a zero-sum game, much like the famous xkcd comic #1530.

import scala.io.StdIn.readLine
import scala.util.Random

object RockPaperScissors {
    def main(args: Array[String]): Unit = {
        // Welcome message
        println("Welcome to Rock, Paper, Scissors!")
        
        // Variables for user and computer choices
        var userChoice = ""
        var computerChoice = ""
        
        // Function to get the user's choice
        def getUserChoice(): String = {
            println("Please enter rock, paper, or scissors:")
            val choice = readLine().toLowerCase()
            choice
        }
        
        // Function to get the computer's choice
        def getComputerChoice(): String = {
            val choices = Array("rock", "paper", "scissors")
            val choice = choices(Random.nextInt(choices.length))
            choice
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
        
        // Main game loop
        var playAgain = true
        while (playAgain) {
            userChoice = getUserChoice()
            computerChoice = getComputerChoice()
            
            println(s"You chose: $userChoice")
            println(s"Computer chose: $computerChoice")
            
            val result = determineWinner(userChoice, computerChoice)
            println(result)
            
            // Ask if the user wants to play again
            println("Do you want to play again? (yes/no)")
            val answer = readLine().toLowerCase()
            if (answer != "yes") {
                playAgain = false
            }
        }
        
        // Goodbye message
        println("Thank you for playing Rock, Paper, Scissors!")
    }
}

