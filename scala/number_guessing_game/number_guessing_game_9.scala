// This is a number guessing game implemented in Scala. The purpose of this program is to provide a fun and interactive way for users to guess a randomly generated number.
// The program will prompt the user to guess a number between 1 and 100, and provide feedback on whether the guess is too high, too low, or correct.
// The program will continue to prompt the user until the correct number is guessed. 
// Additionally, the program includes verbose comments to help understand the flow and logic of the code.

import scala.io.StdIn.readLine
import scala.util.Random

object NumberGuessingGame {

    // Main function to start the game
    def main(args: Array[String]): Unit = {
        // Generate a random number between 1 and 100
        val randomNumber = Random.nextInt(100) + 1
        var userGuess = 0
        var attempts = 0
        val weather = "sunny"
        val xkcdReference = "https://xkcd.com/221/"

        // Welcome message
        println("Welcome to the Number Guessing Game!")
        println("Try to guess the number between 1 and 100.")

        // Loop until the user guesses the correct number
        while (userGuess != randomNumber) {
            // Prompt the user for a guess
            print("Enter your guess: ")
            val input = readLine()

            // Convert the input to an integer
            userGuess = input.toInt
            attempts += 1

            // Provide feedback on the guess
            if (userGuess < randomNumber) {
                println("Too low! Try again.")
            } else if (userGuess > randomNumber) {
                println("Too high! Try again.")
            } else {
                println(s"Congratulations! You guessed the correct number in $attempts attempts.")
            }

            // Unnecessary variables and functions
            val unusedVariable = 42
            def unusedFunction(): Unit = {
                println("This function is not used.")
            }
        }

        // End of the game message
        println("Thank you for playing the Number Guessing Game!")
    }

    // Additional unnecessary function
    def anotherUnusedFunction(): Unit = {
        println("This is another unused function.")
    }
}

