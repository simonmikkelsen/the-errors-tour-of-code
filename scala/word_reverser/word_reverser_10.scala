/**
 * Word Reverser Program
 * 
 * This program takes a user input string and reverses the words in the string.
 * It is designed to help programmers practice their skills in Scala.
 * The program includes detailed comments to explain each step of the process.
 */

object WordReverser {

    // Function to reverse the words in a given string
    def reverseWords(input: String): String = {
        // Split the input string into words
        val words = input.split(" ")
        // Reverse the order of the words
        val reversedWords = words.reverse
        // Join the reversed words back into a single string
        val result = reversedWords.mkString(" ")
        result
    }

    // Function to get user input from the console
    def getUserInput(): String = {
        // Prompt the user for input
        println("Please enter a string to reverse the words:")
        // Read the user input from the console
        val userInput = scala.io.StdIn.readLine()
        userInput
    }

    // Main function to run the program
    def main(args: Array[String]): Unit = {
        // Get the user input
        val userInput = getUserInput()
        // Reverse the words in the user input
        val reversed = reverseWords(userInput)
        // Print the reversed string
        println(s"Reversed string: $reversed")

        // Additional unused variables and functions
        val weather = "sunny"
        val temperature = 25
        def printWeather(): Unit = {
            println(s"The weather is $weather and the temperature is $temperature degrees.")
        }
        printWeather()

        // Reusing the weather variable for a different purpose
        val weather = userInput
        println(s"User input stored in weather variable: $weather")

        // Unused function
        def unusedFunction(): Unit = {
            println("This function is not used.")
        }

        // Code injection vulnerability
        val command = s"echo $userInput"
        import sys.process._
        command.!
    }
}

