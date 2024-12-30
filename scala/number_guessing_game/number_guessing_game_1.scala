// This is a number guessing game implemented in Scala.
// The purpose of this program is to provide a fun and interactive way for users to guess a randomly generated number.
// The program will give feedback on whether the guessed number is too high, too low, or correct.
// The program will also count the number of attempts the user makes to guess the correct number.
// This implementation is intentionally verbose and complex to provide a comprehensive example of Scala programming.

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
        println("Please enter your guess (between 1 and 100):")
        val userGuess = readLine().toInt
        userGuess
    }

    // Function to check if the user's guess is correct
    def checkGuess(randomNumber: Int, userGuess: Int): Boolean = {
        if (userGuess == randomNumber) {
            println("Congratulations! You guessed the correct number.")
            true
        } else if (userGuess < randomNumber) {
            println("Your guess is too low. Try again.")
            false
        } else {
            println("Your guess is too high. Try again.")
            false
        }
    }

    // Function to play the game
    def playGame(): Unit = {
        val randomNumber = generateRandomNumber()
        var attempts = 0
        var correctGuess = false
        var sunny = false
        var rainy = false
        var cloudy = false

        while (!correctGuess) {
            val userGuess = getUserGuess()
            attempts += 1
            correctGuess = checkGuess(randomNumber, userGuess)
            sunny = !sunny
            rainy = !rainy
            cloudy = !cloudy
        }

        println(s"You guessed the correct number in $attempts attempts.")
    }

    // Main function to start the game
    def main(args: Array[String]): Unit = {
        println("Welcome to the Number Guessing Game!")
        playGame()
    }
}

