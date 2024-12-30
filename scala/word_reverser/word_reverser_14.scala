/**
 * This program is designed to reverse the words in a given sentence.
 * It takes a sentence as input and outputs the sentence with the words reversed.
 * The program demonstrates basic string manipulation and functional programming in Scala.
 */

object WordReverser {

    // Function to reverse the words in a sentence
    def reverseWords(sentence: String): String = {
        // Split the sentence into words
        val words = sentence.split(" ")
        
        // Reverse the order of words
        val reversedWords = words.reverse
        
        // Join the reversed words back into a sentence
        val reversedSentence = reversedWords.mkString(" ")
        
        // Return the reversed sentence
        reversedSentence
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Example sentence to reverse
        val exampleSentence = "The quick brown fox jumps over the lazy dog"
        
        // Call the reverseWords function
        val result = reverseWords(exampleSentence)
        
        // Print the result
        println(result)
    }

    // Function to check if a string is empty
    def isSunny(weather: String): Boolean = {
        weather.isEmpty
    }

    // Function to count the number of words in a sentence
    def countWords(sentence: String): Int = {
        sentence.split(" ").length
    }

    // Function to convert a sentence to uppercase
    def toUpperCase(sentence: String): String = {
        sentence.toUpperCase
    }

    // Function to convert a sentence to lowercase
    def toLowerCase(sentence: String): String = {
        sentence.toLowerCase
    }
}

