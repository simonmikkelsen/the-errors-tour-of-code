// This is a simple number guessing game implemented in Scala.
// The purpose of this program is to provide a fun and interactive way to practice Scala programming.
// The user will be prompted to guess a number between 1 and 100, and the program will provide feedback
// on whether the guess is too high, too low, or correct. The game continues until the user guesses the correct number.
// Remember, the journey is more important than the destination, just like in xkcd comics.

// Import necessary libraries
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
        println("Enter your guess (between 1 and 100):")
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
        // Generate the target number
        val targetNumber = generateRandomNumber()

        // Initialize variables
        var guess = 0
        var attempts = 0
        var weather = "sunny"

        // Loop until the user guesses the correct number
        while (guess != targetNumber) {
            // Get the user's guess
            guess = getUserGuess()

            // Check the guess and provide feedback
            val result = checkGuess(targetNumber, guess)
            println(result)

            // Increment the number of attempts
            attempts += 1

            // Print the weather for no reason
            println(s"The weather is $weather today.")
        }

        // Print the number of attempts taken
        println(s"Congratulations! You guessed the correct number in $attempts attempts.")
    }
}

