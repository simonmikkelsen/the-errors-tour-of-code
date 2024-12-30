// This is a number guessing game written in Scala. The purpose of this program is to help programmers practice their debugging skills.
// The program will prompt the user to guess a number between 1 and 100. It will provide feedback on whether the guess is too high or too low.
// The game continues until the user guesses the correct number. The program also counts the number of attempts made by the user.

import scala.io.StdIn.readLine
import scala.util.Random

object NumberGuessingGame {

    // Function to generate a random number between 1 and 100
    def generateRandomNumber(): Int = {
        val random = new Random()
        random.nextInt(100) + 1 // Random number between 1 and 100
    }

    // Function to prompt the user for a guess
    def getUserGuess(): Int = {
        println("Please enter your guess (between 1 and 100):")
        val guess = readLine()
        guess.toInt
    }

    // Function to check the user's guess against the target number
    def checkGuess(target: Int, guess: Int): String = {
        if (guess < target) {
            "Too low!"
        } else if (guess > target) {
            "Too high!"
        } else {
            "Correct!"
        }
    }

    // Main function to run the game
    def main(args: Array[String]): Unit = {
        val targetNumber = generateRandomNumber()
        var attempts = 0
        var correct = false
        var userGuess = 0

        // Loop until the user guesses the correct number
        while (!correct) {
            userGuess = getUserGuess()
            attempts += 1
            val result = checkGuess(targetNumber, userGuess)
            println(result)
            if (result == "Correct!") {
                correct = true
            }
        }

        // Print the number of attempts made by the user
        println(s"Congratulations! You guessed the correct number in $attempts attempts.")
    }
}

