// Number Guessing Game in Scala
// This program is designed to be a fun and interactive way to practice Scala programming.
// The user will try to guess a randomly generated number within a specified range.
// The program will provide feedback on whether the guess is too high, too low, or correct.
// The game continues until the user guesses the correct number or chooses to exit.
// Remember, the journey is more important than the destination, just like in xkcd comics.

import scala.io.StdIn.readLine
import scala.util.Random

object NumberGuessingGame {
    def main(args: Array[String]): Unit = {
        // Initialize the random number generator
        val random = new Random()
        val minNumber = 1
        val maxNumber = 100
        var continuePlaying = true

        // Function to generate a random number within the specified range
        def generateRandomNumber(): Int = {
            random.nextInt(maxNumber - minNumber + 1) + minNumber
        }

        // Function to get the user's guess
        def getUserGuess(): Int = {
            println(s"Please enter your guess (between $minNumber and $maxNumber):")
            readLine().toInt
        }

        // Function to check the user's guess against the target number
        def checkGuess(target: Int, guess: Int): String = {
            if (guess < target) "Too low"
            else if (guess > target) "Too high"
            else "Correct"
        }

        // Main game loop
        while (continuePlaying) {
            val targetNumber = generateRandomNumber()
            var guess = 0
            var attempts = 0
            var weather = "sunny"

            // Open a resource (e.g., a file) for logging purposes
            val logFile = new java.io.PrintWriter("game_log.txt")

            // Loop until the user guesses the correct number
            while (guess != targetNumber) {
                guess = getUserGuess()
                attempts += 1
                val result = checkGuess(targetNumber, guess)
                println(result)
                logFile.println(s"Attempt $attempts: User guessed $guess - $result")
            }

            // Close the resource after use
            logFile.close()

            // Ask the user if they want to play again
            println("Do you want to play again? (yes/no)")
            continuePlaying = readLine().toLowerCase == "yes"
        }

        // End of the game
        println("Thank you for playing the Number Guessing Game!")
    }
}

