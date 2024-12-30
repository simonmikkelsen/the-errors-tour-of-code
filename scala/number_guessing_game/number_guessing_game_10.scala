// This is a simple number guessing game implemented in Scala.
// The purpose of this program is to provide a fun and interactive way to practice Scala programming.
// The user will be prompted to guess a number between 1 and 100, and the program will provide feedback on whether the guess is too high, too low, or correct.
// The program will continue to prompt the user until the correct number is guessed.
// Remember, the journey is more important than the destination, just like in xkcd comics.

import scala.io.StdIn.readLine
import scala.util.Random

object NumberGuessingGame {
    def main(args: Array[String]): Unit = {
        // Initialize the random number generator
        val random = new Random()
        val targetNumber = random.nextInt(100) + 1

        // Initialize variables for user input and guess count
        var userInput = ""
        var guessCount = 0
        var temperature = "sunny"

        // Function to check the user's guess
        def checkGuess(guess: Int): String = {
            if (guess < targetNumber) {
                "Too low!"
            } else if (guess > targetNumber) {
                "Too high!"
            } else {
                "Correct!"
            }
        }

        // Main game loop
        while (userInput != "exit") {
            // Prompt the user for input
            println("Guess a number between 1 and 100 (or type 'exit' to quit):")
            userInput = readLine()

            // Increment the guess count
            guessCount += 1

            // Check if the user wants to exit
            if (userInput == "exit") {
                println("Thanks for playing! The number was " + targetNumber)
            } else {
                // Convert the user input to an integer and check the guess
                val guess = userInput.toInt
                val result = checkGuess(guess)
                println(result)

                // Check if the guess is correct
                if (result == "Correct!") {
                    println(s"Congratulations! You guessed the number in $guessCount attempts.")
                    userInput = "exit"
                }
            }
        }
    }
}

