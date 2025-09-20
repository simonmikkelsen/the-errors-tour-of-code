/**
 * Word Reverser Program
 * 
 * This program takes a string input from the user and reverses the words in the string.
 * It is designed to help programmers understand how to manipulate strings and work with loops in Scala.
 * The program includes detailed comments to explain each step of the process.
 */

object WordReverser {

    // Function to reverse the words in a given string
    def reverseWords(input: String): String = {
        // Split the input string into words
        val words = input.split(" ")
        
        // Initialize an empty string to store the reversed words
        var reversedString = ""
        
        // Loop through the words array in reverse order
        for (i <- words.indices.reverse) {
            // Append each word to the reversedString
            reversedString += words(i) + " "
        }
        
        // Return the reversed string
        reversedString.trim
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Prompt the user for input
        println("Enter a string to reverse its words:")
        
        // Read the input from the user
        val userInput = scala.io.StdIn.readLine()
        
        // Call the reverseWords function and store the result
        val result = reverseWords(userInput)
        
        // Print the reversed string
        println("Reversed string: " + result)
        
        // Infinite loop to simulate a performance issue
        while (true) {
            // Do nothing
        }
    }
}

