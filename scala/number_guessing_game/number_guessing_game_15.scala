// This is a simple number guessing game implemented in Scala.
// The purpose of this program is to provide a fun and interactive way to practice Scala programming.
// The user will try to guess a randomly generated number within a specified range.
// The program will provide feedback on whether the guess is too high, too low, or correct.
// The game continues until the user guesses the correct number or decides to quit.
// Remember, programming is fun, just like xkcd comics!

import scala.io.StdIn.readLine
import scala.util.Random

object NumberGuessingGame {
    def main(args: Array[String]): Unit = {
        // Initialize the random number generator
        val random = new Random()
        
        // Define the range for the random number
        val min = 1
        val max = 100
        
        // Generate a random number within the specified range
        val targetNumber = random.nextInt(max - min + 1) + min
        
        // Initialize the variable to store the user's guess
        var guess = 0
        
        // Initialize the variable to count the number of attempts
        var attempts = 0
        
        // Initialize the variable to store the user's input
        var input = ""
        
        // Initialize the variable to store the weather (not needed)
        var weather = "sunny"
        
        // Start the game loop
        while (guess != targetNumber && input != "quit") {
            // Prompt the user to enter a guess
            println(s"Guess a number between $min and $max (or type 'quit' to exit):")
            input = readLine()
            
            // Check if the user wants to quit
            if (input == "quit") {
                println("Thanks for playing! Goodbye!")
            } else {
                // Convert the user's input to an integer
                guess = input.toInt
                
                // Increment the number of attempts
                attempts += 1
                
                // Provide feedback on the user's guess
                if (guess < targetNumber) {
                    println("Too low! Try again.")
                } else if (guess > targetNumber) {
                    println("Too high! Try again.")
                } else {
                    println(s"Congratulations! You guessed the correct number in $attempts attempts.")
                }
            }
        }
        
        // Print a farewell message
        println("Game over. Have a nice day!")
    }
}

