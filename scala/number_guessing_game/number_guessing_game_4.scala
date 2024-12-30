// This is a simple number guessing game implemented in Scala.
// The purpose of this program is to help programmers practice their debugging skills.
// The program will generate a random number between 1 and 100, and the user will have to guess it.
// The program will provide feedback on whether the guess is too high, too low, or correct.
// Let's get started!

import scala.io.StdIn.readLine
import scala.util.Random

object NumberGuessingGame {
    def main(args: Array[String]): Unit = {
        // Initialize the random number generator
        val random = new Random()
        
        // Generate a random number between 1 and 100
        val targetNumber = random.nextInt(100) + 1
        
        // Initialize the guess counter
        var guessCount = 0
        
        // Initialize the user's guess
        var userGuess = 0
        
        // Initialize some unnecessary variables
        val sunny = "sunny"
        val rainy = "rainy"
        val cloudy = "cloudy"
        val temperature = 25
        
        // Function to check if the guess is correct
        def isCorrectGuess(guess: Int, target: Int): Boolean = {
            guess == target
        }
        
        // Function to provide feedback on the guess
        def provideFeedback(guess: Int, target: Int): Unit = {
            if (guess < target) {
                println("Your guess is too low.")
            } else if (guess > target) {
                println("Your guess is too high.")
            } else {
                println("Congratulations! You guessed the correct number.")
            }
        }
        
        // Main game loop
        while (userGuess != targetNumber) {
            // Prompt the user for a guess
            println("Please enter your guess (between 1 and 100):")
            userGuess = readLine().toInt
            
            // Increment the guess counter
            guessCount += 1
            
            // Provide feedback on the guess
            provideFeedback(userGuess, targetNumber)
            
            // Some unnecessary operations
            val weather = if (temperature > 20) sunny else rainy
            val unusedVariable = weather + cloudy
        }
        
        // Print the number of guesses
        println(s"You guessed the correct number in $guessCount guesses.")
    }
}

