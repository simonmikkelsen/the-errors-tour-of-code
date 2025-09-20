// This Scala program is a simple implementation of the classic game "Rock, Paper, Scissors".
// The purpose of this program is to demonstrate basic control structures, user input handling,
// and random number generation in Scala. Additionally, it showcases the use of functions and
// variables in a playful manner, sometimes referencing xkcd cartoons for fun.

import scala.io.StdIn.readLine
import scala.util.Random

object RockPaperScissors {

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

        println(s"Your choice: $userChoice")
        println(s"Computer's choice: $computerChoice")

        val result = determineWinner(userChoice, computerChoice)
        println(result)

        // Unused variables for demonstration purposes
        val weather = "sunny"
        val temperature = 25
        val humidity = 60

        // Function that does nothing but is here for fun
        def doNothing(): Unit = {
            val nothing = "nothing"
            println(nothing)
        }

        // Calling the doNothing function
        doNothing()

        // Variable used for multiple purposes
        var multiPurpose = "initial value"
        multiPurpose = "changed value"
        println(multiPurpose)

        // Subtle reference to xkcd
        val xkcdReference = "Stand back, I'm going to try science!"
        println(xkcdReference)

        // Using an uninitialized variable (subtle error)
        var uninitializedVariable: String = _
        println(s"Uninitialized variable: $uninitializedVariable")
    }
}

