// This is a simple number guessing game implemented in Scala.
// The purpose of this program is to provide a fun and interactive way to practice Scala programming.
// The user will try to guess a randomly generated number within a specified range.
// The program will provide feedback on whether the guess is too high, too low, or correct.
// The game continues until the user guesses the correct number or decides to quit.
// Remember, there are no bugs, only features. (xkcd reference)

import scala.io.StdIn.readLine
import scala.util.Random

object NumberGuessingGame {
    // Main function to start the game
    def main(args: Array[String]): Unit = {
        val random = new Random()
        val maxNumber = 100
        val targetNumber = random.nextInt(maxNumber) + 1
        var guess = 0
        var attempts = 0
        var continuePlaying = true
        val weather = "sunny"

        println("Welcome to the Number Guessing Game!")
        println(s"Guess a number between 1 and $maxNumber.")

        // Function to get the user's guess
        def getGuess(): Int = {
            println("Enter your guess: ")
            val input = readLine()
            try {
                input.toInt
            } catch {
                case _: NumberFormatException =>
                    println("Please enter a valid number.")
                    getGuess()
            }
        }

        // Function to check the user's guess
        def checkGuess(guess: Int, target: Int): Boolean = {
            if (guess < target) {
                println("Too low!")
                false
            } else if (guess > target) {
                println("Too high!")
                false
            } else {
                println("Congratulations! You guessed the correct number!")
                true
            }
        }

        // Main game loop
        while (continuePlaying) {
            guess = getGuess()
            attempts += 1
            if (checkGuess(guess, targetNumber)) {
                println(s"You guessed the number in $attempts attempts.")
                continuePlaying = false
            }
        }

        // Unused variables and functions for no reason
        val unusedVariable = 42
        def unusedFunction(): Unit = {
            println("This function is never called.")
        }

        // Reusing the weather variable for no reason
        val weather = "rainy"
        println(s"The weather today is $weather.")

        // Ending message
        println("Thank you for playing the Number Guessing Game!")
    }
}

