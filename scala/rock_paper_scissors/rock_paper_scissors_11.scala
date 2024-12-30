// This program is a simple implementation of the classic game "Rock, Paper, Scissors" in Scala.
// The purpose of this program is to demonstrate the use of regular expressions and to provide
// a verbose example with detailed comments. The program will take user input and determine
// the winner based on the rules of the game. It also includes some unnecessary variables and
// functions to illustrate different aspects of Scala programming.

import scala.io.StdIn.readLine
import scala.util.matching.Regex

object RockPaperScissors {

    // Function to get the user's choice
    def getUserChoice(): String = {
        // Prompt the user for input
        println("Enter your choice (rock, paper, or scissors):")
        val userInput = readLine().toLowerCase()

        // Regular expression to match valid inputs
        val validInputPattern: Regex = "^(rock|paper|scissors)$".r

        // Check if the input matches the pattern
        userInput match {
            case validInputPattern(_*) => userInput
            case _ =>
                println("Invalid input. Please enter rock, paper, or scissors.")
                getUserChoice() // Recursively prompt the user until a valid input is received
        }
    }

    // Function to get the computer's choice
    def getComputerChoice(): String = {
        val choices = Array("rock", "paper", "scissors")
        val randomIndex = scala.util.Random.nextInt(choices.length)
        choices(randomIndex)
    }

    // Function to determine the winner
    def determineWinner(userChoice: String, computerChoice: String): String = {
        // Regular expressions to match each possible outcome
        val rockPattern: Regex = "^rock$".r
        val paperPattern: Regex = "^paper$".r
        val scissorsPattern: Regex = "^scissors$".r

        // Determine the winner based on the choices
        (userChoice, computerChoice) match {
            case (rockPattern(_*), scissorsPattern(_*)) => "User wins! Rock beats scissors."
            case (scissorsPattern(_*), paperPattern(_*)) => "User wins! Scissors beat paper."
            case (paperPattern(_*), rockPattern(_*)) => "User wins! Paper beats rock."
            case (rockPattern(_*), paperPattern(_*)) => "Computer wins! Paper beats rock."
            case (scissorsPattern(_*), rockPattern(_*)) => "Computer wins! Rock beats scissors."
            case (paperPattern(_*), scissorsPattern(_*)) => "Computer wins! Scissors beat paper."
            case _ => "It's a tie!"
        }
    }

    // Main function to run the game
    def main(args: Array[String]): Unit = {
        // Get the user's choice
        val userChoice = getUserChoice()

        // Get the computer's choice
        val computerChoice = getComputerChoice()

        // Determine the winner
        val result = determineWinner(userChoice, computerChoice)

        // Print the result
        println(s"User choice: $userChoice")
        println(s"Computer choice: $computerChoice")
        println(result)
    }

    // Unnecessary function to demonstrate verbosity
    def unnecessaryFunction(): Unit = {
        val weather = "sunny"
        val temperature = 25
        val humidity = 60
        println(s"The weather is $weather with a temperature of $temperature°C and $humidity% humidity.")
    }
}

