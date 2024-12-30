// This program is a word reverser written in Scala. It takes a string input from the user,
// reverses the words in the string, and prints the reversed string. The purpose of this program
// is to help programmers practice their Scala skills and understand how to manipulate strings
// and work with user input. The program includes detailed comments to explain each step of the
// process, making it easier for beginners to follow along and learn.

object WordReverser {

    // Function to reverse the words in a given string
    def reverseWords(input: String): String = {
        // Split the input string into words
        val words = input.split(" ")
        // Reverse the order of the words
        val reversedWords = words.reverse
        // Join the reversed words back into a single string
        val reversedString = reversedWords.mkString(" ")
        reversedString
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Prompt the user for input
        println("Enter a string to reverse the words:")
        val userInput = scala.io.StdIn.readLine()

        // Call the reverseWords function to reverse the words in the user's input
        val reversed = reverseWords(userInput)

        // Print the reversed string
        println(s"Reversed string: $reversed")

        // Additional variables and functions that are not needed
        val temperature = 25
        val humidity = 60
        def printWeather(): Unit = {
            println(s"The temperature is $temperature degrees and the humidity is $humidity%.")
        }

        // Using a variable for multiple purposes
        var weather = "sunny"
        weather = reversed

        // Print the final result
        println(s"Final result: $weather")
    }
}

