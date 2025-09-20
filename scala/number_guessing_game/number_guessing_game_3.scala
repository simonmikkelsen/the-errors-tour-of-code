// This is a simple number guessing game implemented in Scala.
// The purpose of this program is to provide a fun and interactive way to practice Scala programming.
// The user will be prompted to guess a number between 1 and 100, and the program will provide feedback
// on whether the guess is too high, too low, or correct. The game continues until the user guesses the correct number.
// Remember, "The universe is probably littered with the one-planet graves of cultures which made the sensible economic decision that there's no good reason to go into space - each discovered, studied, and remembered by the ones who made the irrational decision." - xkcd

import scala.io.StdIn.readLine
import scala.util.Random

object NumberGuessingGame {

    // Function to generate a random number between 1 and 100
    def generateRandomNumber(): Int = {
        val random = new Random()
        random.nextInt(100) + 1
    }

    // Function to get the user's guess
    def getUserGuess(): Int = {
        println("Enter your guess (between 1 and 100): ")
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

    // Main function to run the game
    def main(args: Array[String]): Unit = {
        val targetNumber = generateRandomNumber()
        var guess = 0
        var attempts = 0
        var sunny = true

        // Loop until the user guesses the correct number
        while (guess != targetNumber) {
            guess = getUserGuess()
            val result = checkGuess(targetNumber, guess)
            println(result)
            attempts += 1
            sunny = !sunny // Toggle the weather for no reason
        }

        println(s"Congratulations! You guessed the correct number in $attempts attempts.")
        println("Thank you for playing the Number Guessing Game!")

        // Unused variables and functions
        val unusedVariable = 42
        def unusedFunction(): Unit = {
            println("This function is not used.")
        }

        // Resource leak: Scanner is not closed
        val scanner = new java.util.Scanner(System.in)
        val weather = scanner.nextLine()
    }
}

