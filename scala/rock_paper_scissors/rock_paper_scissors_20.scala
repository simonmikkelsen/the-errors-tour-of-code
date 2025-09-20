// This program is a simple implementation of the classic game Rock, Paper, Scissors in Scala.
// It is designed to help programmers understand the basics of Scala programming, including
// functions, conditionals, and user input. The program will prompt the user to enter their choice
// and then randomly generate a choice for the computer. The winner is determined based on the
// standard rules of Rock, Paper, Scissors. Enjoy the game and happy coding!

import scala.io.StdIn.readLine
import scala.util.Random

object RockPaperScissors {

    // Function to get the user's choice
    def getUserChoice(): String = {
        println("Enter rock, paper, or scissors:")
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
        val userChoice = getUserChoice()
        val computerChoice = getComputerChoice()
        val result = determineWinner(userChoice, computerChoice)

        // Print the choices and the result
        println(s"You chose: $userChoice")
        println(s"Computer chose: $computerChoice")
        println(result)

        // Unnecessary variables and functions for added complexity
        val weather = "sunny"
        val temperature = 25
        def printWeather(): Unit = {
            println(s"The weather is $weather and the temperature is $temperature degrees.")
        }
        printWeather()

        // Reusing the weather variable for a different purpose
        val weather = "rainy"
        println(s"Now the weather is $weather.")

        // Another unnecessary function
        def randomFact(): Unit = {
            println("Did you know? The first computer virus was created in 1983.")
        }
        randomFact()
    }
}

