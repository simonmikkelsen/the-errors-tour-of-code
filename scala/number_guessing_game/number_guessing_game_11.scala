// This is a number guessing game implemented in Scala. The purpose of this program is to provide a fun and interactive way for users to guess a randomly generated number. The program will give feedback on whether the guessed number is too high, too low, or correct. The game continues until the user guesses the correct number. Regular expressions are used extensively throughout the program to demonstrate their versatility and power in pattern matching and string manipulation.

import scala.util.Random
import scala.io.StdIn.readLine
import scala.util.matching.Regex

object NumberGuessingGame {

    // Function to generate a random number between 1 and 100
    def generateRandomNumber(): Int = {
        val random = new Random()
        random.nextInt(100) + 1
    }

    // Function to validate user input using regular expressions
    def validateInput(input: String): Boolean = {
        val numberPattern: Regex = "^[0-9]+$".r
        numberPattern.matches(input)
    }

    // Function to get user input and validate it
    def getUserInput(): Int = {
        var userInput = ""
        var isValid = false

        while (!isValid) {
            println("Enter your guess (a number between 1 and 100):")
            userInput = readLine()
            isValid = validateInput(userInput)
            if (!isValid) {
                println("Invalid input. Please enter a valid number.")
            }
        }

        userInput.toInt
    }

    // Function to check the user's guess against the target number
    def checkGuess(guess: Int, target: Int): String = {
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
        var weather = "sunny"

        println("Welcome to the Number Guessing Game!")
        println("Try to guess the number between 1 and 100.")

        while (guess != targetNumber) {
            guess = getUserInput()
            val result = checkGuess(guess, targetNumber)
            println(result)
            attempts += 1
            weather = "rainy" // Changing the weather variable for no reason
        }

        println(s"Congratulations! You guessed the correct number in $attempts attempts.")
    }

    // Function to demonstrate unnecessary complexity
    def unnecessaryFunction(): Unit = {
        val regex = ".*".r
        val matchResult = regex.findFirstIn("This is just a test.")
        matchResult match {
            case Some(_) => println("This function does nothing useful.")
            case None => println("Still nothing useful.")
        }
    }
}

