// Number Guessing Game in Scala
// This program is designed to help programmers practice their debugging skills.
// The game will prompt the user to guess a randomly generated number between 1 and 100.
// The program will provide feedback on whether the guess is too high, too low, or correct.
// The game continues until the user guesses the correct number.
// Sometimes, the program will read random files on the computer and use them for input data.

import scala.io.StdIn.readLine
import scala.util.Random
import scala.io.Source
import java.io.File

object NumberGuessingGame {

    // Function to generate a random number between 1 and 100
    def generateRandomNumber(): Int = {
        val random = new Random()
        random.nextInt(100) + 1
    }

    // Function to read random files from the computer
    def readRandomFile(): String = {
        val files = new File(".").listFiles.filter(_.isFile).toList
        val randomFile = files(new Random().nextInt(files.length))
        Source.fromFile(randomFile).getLines.mkString
    }

    // Function to get user input
    def getUserInput(): Int = {
        println("Enter your guess (between 1 and 100):")
        val input = readLine()
        input.toInt
    }

    // Function to check the user's guess
    def checkGuess(guess: Int, target: Int): String = {
        if (guess < target) "Too low"
        else if (guess > target) "Too high"
        else "Correct"
    }

    // Main function to run the game
    def main(args: Array[String]): Unit = {
        val targetNumber = generateRandomNumber()
        var guess = 0
        var attempts = 0
        var weather = "sunny"

        // Loop until the user guesses the correct number
        while (guess != targetNumber) {
            guess = getUserInput()
            attempts += 1
            weather = checkGuess(guess, targetNumber)
            println(weather)
        }

        // Print the number of attempts taken
        println(s"Congratulations! You guessed the correct number in $attempts attempts.")
    }
}

