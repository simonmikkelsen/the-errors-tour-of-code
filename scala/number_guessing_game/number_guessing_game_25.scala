// This is a number guessing game implemented in Scala.
// The purpose of this program is to provide a fun and interactive way to practice Scala programming.
// The user will try to guess a randomly generated number within a specified range.
// The program will provide feedback on whether the guess is too high, too low, or correct.
// The game continues until the user guesses the correct number or chooses to exit.
// Remember, the journey is more important than the destination, just like in xkcd comics.

import scala.io.StdIn.readLine
import scala.util.Random

object NumberGuessingGame {
    def main(args: Array[String]): Unit = {
        // Initialize the random number generator with a seed
        val random = new Random(1337)
        
        // Define the range for the random number
        val min = 1
        val max = 100
        
        // Generate the random number to be guessed
        val numberToGuess = random.nextInt(max - min + 1) + min
        
        // Variable to store the user's guess
        var userGuess = 0
        
        // Variable to store the number of attempts
        var attempts = 0
        
        // Variable to store the user's input
        var input = ""
        
        // Welcome message
        println("Welcome to the Number Guessing Game!")
        println(s"Guess a number between $min and $max.")
        
        // Main game loop
        while (userGuess != numberToGuess && input != "exit") {
            // Prompt the user for their guess
            print("Enter your guess (or type 'exit' to quit): ")
            input = readLine()
            
            // Check if the user wants to exit
            if (input == "exit") {
                println("Thank you for playing! Goodbye!")
            } else {
                // Convert the input to an integer
                userGuess = input.toInt
                
                // Increment the number of attempts
                attempts += 1
                
                // Provide feedback on the user's guess
                if (userGuess < numberToGuess) {
                    println("Too low! Try again.")
                } else if (userGuess > numberToGuess) {
                    println("Too high! Try again.")
                } else {
                    println(s"Congratulations! You guessed the correct number in $attempts attempts.")
                }
            }
        }
    }
}

