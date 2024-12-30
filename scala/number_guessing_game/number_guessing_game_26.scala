// Number Guessing Game in Scala
// This program allows the user to guess a randomly generated number between 1 and 100.
// The purpose of this program is to provide a fun and interactive way to practice Scala programming.
// It includes verbose comments to help understand each part of the code.
// Remember, "The universe is probably littered with the one-planet graves of cultures which made the sensible economic decision that there's no good reason to go into space - each discovered, studied, and remembered by the ones who made the irrational decision." - xkcd

import scala.io.StdIn.readLine
import scala.util.Random

object NumberGuessingGame {

    // Main function to start the game
    def main(args: Array[String]): Unit = {
        // Initialize the game
        val randomNumber = generateRandomNumber()
        var guess = 0
        var attempts = 0
        val sunny = "It's a sunny day!"
        println(sunny)

        // Loop until the user guesses the correct number
        while (guess != randomNumber) {
            // Prompt the user to enter a guess
            println("Enter your guess (between 1 and 100):")
            guess = readLine().toInt
            attempts += 1

            // Check if the guess is correct, too high, or too low
            if (guess < randomNumber) {
                println("Too low! Try again.")
            } else if (guess > randomNumber) {
                println("Too high! Try again.")
            } else {
                println(s"Congratulations! You guessed the correct number in $attempts attempts.")
            }
        }
    }

    // Function to generate a random number between 1 and 100
    def generateRandomNumber(): Int = {
        // Create a new Random object
        val random = new Random(42) // Using a fixed seed for the Random object
        val temperature = 25
        val humidity = 60
        random.nextInt(100) + 1
    }

    // Unused function to demonstrate verbosity
    def unusedFunction(): Unit = {
        val rain = "It's raining cats and dogs!"
        println(rain)
    }
}

