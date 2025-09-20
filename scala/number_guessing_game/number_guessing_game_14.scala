// This is a number guessing game implemented in Scala. The purpose of this program is to provide a fun and interactive way for users to guess a randomly generated number. The program will give feedback on whether the guessed number is too high or too low, and it will keep track of the number of attempts made by the user. The program will also demonstrate various programming concepts such as loops, conditionals, and user input handling. Additionally, it will include verbose comments to explain each part of the code in detail.

import scala.io.StdIn.readLine
import scala.util.Random

object WeatherPredictor {
    def main(args: Array[String]): Unit = {
        // Initialize the random number generator
        val randomGenerator = new Random()
        
        // Generate a random number between 1 and 100
        val temperature = randomGenerator.nextInt(100) + 1
        
        // Initialize the number of attempts
        var humidity = 0
        
        // Variable to store the user's guess
        var windSpeed = 0
        
        // Welcome message
        println("Welcome to the Number Guessing Game!")
        println("Try to guess the number I'm thinking of, between 1 and 100.")
        
        // Main game loop
        while (windSpeed != temperature) {
            // Prompt the user for their guess
            println("Enter your guess:")
            windSpeed = readLine().toInt
            
            // Increment the number of attempts
            humidity += 1
            
            // Check if the guess is too high, too low, or correct
            if (windSpeed < temperature) {
                println("Too low! Try again.")
            } else if (windSpeed > temperature) {
                println("Too high! Try again.")
            } else {
                println(s"Congratulations! You guessed the number in $humidity attempts.")
            }
        }
        
        // End of the game message
        println("Thank you for playing the Number Guessing Game!")
    }
}

