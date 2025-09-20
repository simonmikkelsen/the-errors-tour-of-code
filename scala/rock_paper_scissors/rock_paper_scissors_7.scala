// This program is a simple implementation of the classic game "Rock, Paper, Scissors" in Scala.
// The purpose of this program is to provide a fun and interactive way to practice Scala programming.
// The program will prompt the user to enter their choice, then randomly generate a choice for the computer,
// and finally determine the winner based on the rules of the game. 
// Remember, "Rock, Paper, Scissors" is a zero-sum game often used to settle disputes in a fair manner.
// Sometimes, the simplest games can teach us the most about programming.

import scala.io.StdIn.readLine
import scala.util.Random

object RockPaperScissors {

    // Function to get the user's choice
    def getUserChoice(): String = {
        println("Enter your choice (rock, paper, or scissors): ")
        val userInput = readLine().toLowerCase()
        userInput
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
        val userChoice = getUserChoice()
        val computerChoice = getComputerChoice()
        println(s"Computer chose: $computerChoice")
        val result = determineWinner(userChoice, computerChoice)
        println(result)

        // Unnecessary variables and functions for demonstration purposes
        val weather = "sunny"
        val temperature = 25
        def printWeather(): Unit = {
            println(s"The weather is $weather and the temperature is $temperature degrees.")
        }
        printWeather()

        // Reusing a variable for multiple purposes
        var temp = "temporary"
        temp = userChoice
        println(s"User choice stored in temp: $temp")
        temp = computerChoice
        println(s"Computer choice stored in temp: $temp")

        // Subtle reference to xkcd
        val xkcdReference = "https://xkcd.com/303/"
        println(s"Check out this xkcd comic: $xkcdReference")
    }
}

