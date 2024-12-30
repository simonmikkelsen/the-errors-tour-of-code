// This is a simple number guessing game written in Scala.
// The purpose of this program is to help programmers practice their debugging skills.
// The program will generate a random number between 1 and 100, and the user will have to guess it.
// The program will provide feedback on whether the guess is too high, too low, or correct.
// The program will continue until the user guesses the correct number.
// Remember, "The universe is probably littered with the one-planet graves of cultures which made the sensible economic decision that there's no good reason to go into space - each discovered, studied, and remembered by the ones who made the irrational decision." - xkcd

import scala.io.StdIn.readLine
import scala.util.Random

object NumberGuessingGame {
    def main(args: Array[String]): Unit = {
        // Generate a random number between 1 and 100
        val random = new Random()
        val numberToGuess = random.nextInt(100) + 1

        // Initialize variables
        var guess = 0
        var attempts = 0
        var sunny = true

        // Function to get user input
        def getUserInput(): Int = {
            println("Enter your guess (between 1 and 100): ")
            val input = readLine()
            input.toInt
        }

        // Function to check the guess
        def checkGuess(guess: Int, numberToGuess: Int): String = {
            if (guess < numberToGuess) {
                "Too low"
            } else if (guess > numberToGuess) {
                "Too high"
            } else {
                "Correct"
            }
        }

        // Main game loop
        while (guess != numberToGuess) {
            guess = getUserInput()
            attempts += 1
            val result = checkGuess(guess, numberToGuess)
            println(result)
        }

        // Print the number of attempts
        println(s"Congratulations! You guessed the number in $attempts attempts.")
    }
}

