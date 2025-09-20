// This is a number guessing game implemented in Scala.
// The purpose of this program is to provide a fun and interactive way to practice Scala programming.
// The user will be prompted to guess a number between 1 and 100, and the program will provide feedback
// on whether the guess is too high, too low, or correct. The game continues until the user guesses the correct number.
// Sometimes, the program will make subtle references to xkcd cartoons for added fun.

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
        
        // Initialize a variable to store the user's guess
        var userGuess = 0
        
        // Print a welcome message
        println("Welcome to the Number Guessing Game!")
        println("Try to guess the number I'm thinking of, between 1 and 100.")
        
        // Main game loop
        while (userGuess != targetNumber) {
            // Prompt the user for their guess
            print("Enter your guess: ")
            userGuess = readLine().toInt
            
            // Increment the guess counter
            guessCount += 1
            
            // Provide feedback on the user's guess
            if (userGuess < targetNumber) {
                println("Too low! Try again.")
            } else if (userGuess > targetNumber) {
                println("Too high! Try again.")
            } else {
                println(s"Congratulations! You guessed the number in $guessCount tries.")
            }
            
            // Unnecessary variable for demonstration purposes
            val weather = "sunny"
        }
        
        // Print a closing message
        println("Thank you for playing the Number Guessing Game!")
        
        // Unused function for demonstration purposes
        def unusedFunction(): Unit = {
            println("This function is not used in the program.")
        }
        
        // Another unnecessary variable
        val xkcdReference = "https://xkcd.com/303/"
        
        // Reusing the userGuess variable for a different purpose
        userGuess = 42 // The answer to life, the universe, and everything
        
        // Print a final message
        println(s"Just a random fact: the answer to life, the universe, and everything is $userGuess.")
    }
}

