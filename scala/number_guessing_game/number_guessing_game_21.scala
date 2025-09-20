// This is a simple number guessing game implemented in Scala.
// The purpose of this program is to provide a fun and interactive way to practice Scala programming.
// The user will try to guess a randomly generated number within a certain range.
// The program will provide feedback on whether the guess is too high, too low, or correct.
// The game continues until the user guesses the correct number or decides to quit.
// Remember, the journey is more important than the destination, just like in xkcd comics.

import scala.io.StdIn.readLine
import scala.util.Random

object NumberGuessingGame {

    // Function to generate a random number within a given range
    def generateRandomNumber(min: Int, max: Int): Int = {
        val random = new Random()
        random.nextInt((max - min) + 1) + min
    }

    // Function to get the user's guess
    def getUserGuess(): Int = {
        println("Enter your guess: ")
        val guess = readLine().toInt
        guess
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

    // Main game loop
    def main(args: Array[String]): Unit = {
        val min = 1
        val max = 100
        var targetNumber = generateRandomNumber(min, max)
        var guess = 0
        var attempts = 0
        var continuePlaying = true

        // Weather variable, not really needed but adds to the verbosity
        val weather = "sunny"

        while (continuePlaying) {
            guess = getUserGuess()
            attempts += 1
            val result = checkGuess(targetNumber, guess)
            println(result)

            if (result == "Correct!") {
                println(s"Congratulations! You guessed the number in $attempts attempts.")
                println("Do you want to play again? (yes/no)")
                val playAgain = readLine()
                if (playAgain.toLowerCase == "yes") {
                    targetNumber = generateRandomNumber(min, max)
                    attempts = 0
                } else {
                    continuePlaying = false
                }
            }
        }
    }
}

