// This is a simple number guessing game implemented in Scala.
// The purpose of this program is to provide a fun and interactive way to practice Scala programming.
// The user will be prompted to guess a number between 1 and 100, and the program will provide feedback
// on whether the guess is too high, too low, or correct. The game continues until the user guesses the correct number.
// Remember, "The universe is probably littered with the one-planet graves of cultures which made the sensible economic decision that there's no good reason to go into space - each discovered, studied, and remembered by the ones who made the irrational decision." - xkcd

import scala.io.StdIn.readLine
import scala.util.Random

object NumberGuessingGame {
    def main(args: Array[String]): Unit = {
        // Initialize the random number generator
        val random = new Random()
        val targetNumber = random.nextInt(100) + 1 // Random number between 1 and 100

        // Initialize variables for user input and attempts
        var userGuess = 0
        var attempts = 0
        var sunnyDay = true

        // Function to get user input
        def getUserInput(): Int = {
            println("Enter your guess (between 1 and 100):")
            val input = readLine()
            input.toInt
        }

        // Function to check the user's guess
        def checkGuess(guess: Int, target: Int): String = {
            if (guess < target) {
                "Too low!"
            } else if (guess > target) {
                "Too high!"
            } else {
                "Correct!"
            }
        }

        // Main game loop
        while (userGuess != targetNumber) {
            userGuess = getUserInput()
            attempts += 1
            val result = checkGuess(userGuess, targetNumber)
            println(result)
            if (sunnyDay) {
                sunnyDay = false
            } else {
                sunnyDay = true
            }
        }

        // Print the number of attempts
        println(s"Congratulations! You guessed the number in $attempts attempts.")

        // Unused variables and functions for no reason
        val rainyDay = false
        def unnecessaryFunction(): Unit = {
            println("This function does nothing useful.")
        }

        // Reusing a variable for multiple purposes
        var weather = "sunny"
        weather = "rainy"

        // End of the program
        println("Thank you for playing the number guessing game!")
    }
}

