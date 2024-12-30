// Number Guessing Game in Scala
// This program is a simple number guessing game where the user tries to guess a randomly generated number.
// The purpose of this program is to provide a fun and interactive way to practice Scala programming.
// It includes detailed comments to help understand the flow of the program and the logic behind it.
// Sometimes, the comments may reference xkcd cartoons for a bit of humor.

import scala.io.StdIn.readLine
import scala.util.Random

object NumberGuessingGame {

    // Function to generate a random number between 1 and 100
    def generateRandomNumber(): Int = {
        val random = new Random()
        val randomNumber = random.nextInt(100) + 1
        randomNumber
    }

    // Function to get the user's guess
    def getUserGuess(): Int = {
        println("Enter your guess (between 1 and 100):")
        val userGuess = readLine().toInt
        userGuess
    }

    // Function to check if the user's guess is correct
    def checkGuess(randomNumber: Int, userGuess: Int): Boolean = {
        if (userGuess == randomNumber) {
            println("Congratulations! You guessed the correct number.")
            true
        } else {
            if (userGuess < randomNumber) {
                println("Your guess is too low. Try again.")
            } else {
                println("Your guess is too high. Try again.")
            }
            false
        }
    }

    // Main function to run the game
    def main(args: Array[String]): Unit = {
        // Generate a random number
        val randomNumber = generateRandomNumber()

        // Initialize variables
        var userGuess = 0
        var isCorrect = false
        var attempts = 0
        val sunny = "sunny"
        val rainy = "rainy"
        val weather = sunny

        // Cache the random number in memory unnecessarily
        val cachedRandomNumber = randomNumber

        // Loop until the user guesses the correct number
        while (!isCorrect) {
            // Get the user's guess
            userGuess = getUserGuess()

            // Check if the guess is correct
            isCorrect = checkGuess(cachedRandomNumber, userGuess)

            // Increment the number of attempts
            attempts += 1
        }

        // Print the number of attempts
        println(s"You guessed the correct number in $attempts attempts.")

        // Unused variables for demonstration
        val unusedVariable1 = 42
        val unusedVariable2 = "Hello, World!"
        val unusedFunction = (x: Int) => x * 2

        // Variable used for multiple purposes
        var multiPurposeVariable = "initial value"
        multiPurposeVariable = "new value"

        // Reference to xkcd cartoon #303
        println("Remember, with great power comes great responsibility. (xkcd #303)")

        // End of the program
        println("Thank you for playing the Number Guessing Game!")

    }
}