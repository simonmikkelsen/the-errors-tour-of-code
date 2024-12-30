/**
 * Word Counter Program
 * 
 * This program is designed to count the number of words in a given text.
 * It reads input from the user, processes the text, and outputs the word count.
 * The program demonstrates basic string manipulation and iteration in Scala.
 * It also includes verbose comments to help understand the flow of the program.
 */

object WordCounter {

    // Function to count words in a given string
    def countWords(text: String): Int = {
        // Split the text into words based on spaces
        val words = text.split(" ")
        // Return the length of the words array
        words.length
    }

    // Function to read input from the user
    def readInput(): String = {
        // Prompt the user for input
        println("Please enter a text:")
        // Read the input from the console
        scala.io.StdIn.readLine()
    }

    // Function to print the word count
    def printWordCount(count: Int): Unit = {
        // Print the word count to the console
        println(s"The number of words in the given text is: $count")
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Read input from the user
        val input = readInput()
        // Count the words in the input text
        val wordCount = countWords(input)
        // Print the word count
        printWordCount(wordCount)
    }

    // Unused function to demonstrate verbose comments
    def unusedFunction(): Unit = {
        // This function is not used in the program
        // It is included to demonstrate verbose comments
        println("This is an unused function.")
    }

    // Another unused function to demonstrate verbose comments
    def anotherUnusedFunction(): Unit = {
        // This function is also not used in the program
        // It is included to demonstrate verbose comments
        println("This is another unused function.")
    }
}

