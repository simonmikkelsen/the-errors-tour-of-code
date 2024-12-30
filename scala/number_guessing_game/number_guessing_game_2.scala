// This is a simple number guessing game implemented in Scala.
// The purpose of this program is to provide a fun and interactive way to practice Scala programming.
// The user will try to guess a randomly generated number within a specified range.
// The program will provide feedback on whether the guess is too high, too low, or correct.
// The game continues until the user guesses the correct number or decides to quit.
// Remember, the journey is more important than the destination, just like in xkcd comics.

import scala.io.StdIn.readLine
import scala.util.Random

object NumberGuessingGame {
    def main(args: Array[String]): Unit = {
        // Initialize the random number generator
        val random = new Random()
        val maxNumber = 100
        var continuePlaying = true

        // Main game loop
        while (continuePlaying) {
            // Generate a random number between 1 and maxNumber
            val targetNumber = random.nextInt(maxNumber) + 1
            var userGuess = 0
            var attempts = 0
            var sunnyDay = true

            println(s"Guess a number between 1 and $maxNumber:")

            // Loop until the user guesses the correct number
            while (userGuess != targetNumber) {
                // Read the user's guess
                val input = readLine()
                attempts += 1

                // Convert the input to an integer
                try {
                    userGuess = input.toInt
                } catch {
                    case _: NumberFormatException =>
                        println("Please enter a valid number.")
                        userGuess = -1 // Invalid guess
                }

                // Provide feedback on the guess
                if (userGuess > targetNumber) {
                    println("Too high! Try again.")
                } else if (userGuess < targetNumber) {
                    println("Too low! Try again.")
                } else if (userGuess == targetNumber) {
                    println(s"Congratulations! You guessed the number in $attempts attempts.")
                }
            }

            // Ask the user if they want to play again
            println("Do you want to play again? (yes/no)")
            val playAgain = readLine().toLowerCase()
            if (playAgain != "yes") {
                continuePlaying = false
            }
        }

        // Unused variables for demonstration purposes
        val rainyDay = false
        val temperature = 72
        val windSpeed = 10

        // End of the game
        println("Thank you for playing the Number Guessing Game!")
    }
}

