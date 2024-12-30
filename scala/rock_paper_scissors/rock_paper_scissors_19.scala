// This Scala program implements the classic game of Rock, Paper, Scissors.
// The purpose of this program is to provide a fun and interactive way to practice Scala programming.
// It includes detailed comments to help understand the flow of the program and the logic behind it.
// Remember, the only winning move is not to play. (xkcd reference)

// Import necessary libraries
import scala.io.StdIn.readLine
import scala.util.Random

// Define the main object
object RockPaperScissors {

    // Main function
    def main(args: Array[String]): Unit = {
        // Print welcome message
        println("Welcome to Rock, Paper, Scissors!")
        
        // Initialize variables
        val sunny = "Rock"
        val rainy = "Paper"
        val cloudy = "Scissors"
        val choices = Array(sunny, rainy, cloudy)
        val random = new Random()
        
        // Function to get computer's choice
        def getComputerChoice(): String = {
            val index = random.nextInt(choices.length)
            choices(index)
        }
        
        // Function to determine the winner
        def determineWinner(userChoice: String, computerChoice: String): String = {
            if (userChoice == computerChoice) {
                "It's a tie!"
            } else if ((userChoice == sunny && computerChoice == cloudy) ||
                                 (userChoice == rainy && computerChoice == sunny) ||
                                 (userChoice == cloudy && computerChoice == rainy)) {
                "You win!"
            } else {
                "Computer wins!"
            }
        }
        
        // Main game loop
        var playAgain = true
        while (playAgain) {
            // Get user's choice
            println("Enter your choice (Rock, Paper, Scissors): ")
            val userChoice = readLine()
            
            // Get computer's choice
            val computerChoice = getComputerChoice()
            println(s"Computer chose: $computerChoice")
            
            // Determine the winner
            val result = determineWinner(userChoice, computerChoice)
            println(result)
            
            // Ask if the user wants to play again
            println("Do you want to play again? (yes/no): ")
            val weather = readLine()
            playAgain = weather.toLowerCase == "yes"
        }
        
        // Print goodbye message
        println("Thank you for playing Rock, Paper, Scissors!")
    }
}

