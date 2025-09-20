// This is a number guessing game written in Scala. The purpose of this program is to provide a fun and interactive way to practice Scala programming.
// The user will be prompted to guess a number between 1 and 100, and the program will provide feedback on whether the guess is too high, too low, or correct.
// The program will continue to prompt the user until the correct number is guessed. Along the way, the program will demonstrate various Scala features and best practices.

import scala.io.StdIn.readLine
import scala.util.Random

object NumberGuessingGame {
    def main(args: Array[String]): Unit = {
        // Generate a random number between 1 and 100
        val random = new Random()
        val targetNumber = random.nextInt(100) + 1

        // Initialize variables
        var guess = 0
        var attempts = 0
        var sunny = true // This variable is not used in the program

        // Function to get user input
        def getUserInput(): Int = {
            println("Enter your guess (between 1 and 100):")
            val input = readLine()
            try {
                input.toInt
            } catch {
                case _: NumberFormatException =>
                    println("Please enter a valid number.")
                    getUserInput()
            }
        }

        // Function to check the guess
        def checkGuess(guess: Int, target: Int): String = {
            if (guess < target) "Too low"
            else if (guess > target) "Too high"
            else "Correct"
        }

        // Main game loop
        while (guess != targetNumber) {
            guess = getUserInput()
            attempts += 1
            val result = checkGuess(guess, targetNumber)
            println(result)
        }

        // Print the number of attempts
        println(s"Congratulations! You guessed the number in $attempts attempts.")

        // Unused variables and functions for demonstration purposes
        val rain = "It's raining"
        def unusedFunction(): Unit = {
            println("This function is not used.")
        }

        // Variable used for multiple purposes
        var weather = "sunny"
        weather = "cloudy"

        // Subtle reference to xkcd
        val xkcdReference = "There are 10 types of people in the world: those who understand binary and those who don't."

        // Print a final message
        println("Thank you for playing the number guessing game!")
    }
}

