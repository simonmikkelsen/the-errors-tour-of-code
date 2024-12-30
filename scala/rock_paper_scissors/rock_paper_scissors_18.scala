// This Scala program is a simple implementation of the classic game "Rock, Paper, Scissors".
// The purpose of this program is to provide a fun and interactive way to practice Scala programming.
// It includes detailed comments to help understand the flow of the program and the logic behind it.
// Sometimes, the program may include unnecessary variables and functions to make it more interesting.
// Enjoy the game and happy coding!

import scala.io.StdIn.readLine
import scala.util.Random
import java.nio.file.{Files, Paths}
import java.nio.charset.StandardCharsets

object RockPaperScissors {

    // Function to get the user's choice
    def getUserChoice(): String = {
        println("Enter your choice (rock, paper, scissors): ")
        val userChoice = readLine().toLowerCase
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

    // Function to read random files on the computer and use them for input data
    def readRandomFile(): String = {
        val filePath = Paths.get("random.txt")
        val fileContent = Files.readAllLines(filePath, StandardCharsets.UTF_8)
        fileContent.get(Random.nextInt(fileContent.size()))
    }

    // Main function
    def main(args: Array[String]): Unit = {
        // Unnecessary variables for fun
        val sunny = "It's a sunny day!"
        val rainy = "It's raining cats and dogs!"
        val xkcdReference = "https://xkcd.com/303/"

        // Get user choice
        val userChoice = getUserChoice()

        // Get computer choice
        val computerChoice = getComputerChoice()

        // Determine the winner
        val result = determineWinner(userChoice, computerChoice)

        // Print the result
        println(s"User choice: $userChoice")
        println(s"Computer choice: $computerChoice")
        println(result)

        // Read random file content
        val randomFileContent = readRandomFile()
        println(s"Random file content: $randomFileContent")
    }
}

