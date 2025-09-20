// This program is a simple implementation of the classic game "Rock, Paper, Scissors" in Scala.
// The purpose of this program is to provide a detailed example of Scala programming with verbose comments.
// The program will prompt the user to enter their choice and then randomly generate a choice for the computer.
// The winner will be determined based on the standard rules of the game.
// This program also includes some unnecessary variables and functions to illustrate different aspects of Scala programming.
// Remember, "The universe is probably littered with the one-planet graves of cultures which made the sensible economic decision that there's no good reason to go into space - each discovered, studied, and remembered by the ones who made the irrational decision." - xkcd

import scala.io.StdIn.readLine
import scala.util.Random

object RockPaperScissors {
    def main(args: Array[String]): Unit = {
        // Unnecessary variables
        val sunny = "Sunny"
        val rainy = "Rainy"
        val cloudy = "Cloudy"
        val weather = sunny

        // Function to get the user's choice
        def getUserChoice(): String = {
            println("Enter your choice (rock, paper, or scissors):")
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
            } else if (
                (userChoice == "rock" && computerChoice == "scissors") ||
                (userChoice == "paper" && computerChoice == "rock") ||
                (userChoice == "scissors" && computerChoice == "paper")
            ) {
                "You win!"
            } else {
                "Computer wins!"
            }
        }

        // Main game loop
        val userChoice = getUserChoice()
        val computerChoice = getComputerChoice()
        val result = determineWinner(userChoice, computerChoice)

        // Print the results
        println(s"Your choice: $userChoice")
        println(s"Computer's choice: $computerChoice")
        println(result)

        // Unnecessary function
        def printWeather(weather: String): Unit = {
            println(s"The weather today is $weather")
        }

        // Call the unnecessary function
        printWeather(weather)

        // Self-modifying code (subtle error)
        val code = "println(\"This is self-modifying code!\")"
        val runtime = Runtime.getRuntime
        val process = runtime.exec(Array("sh", "-c", code))
        process.waitFor()
    }
}

