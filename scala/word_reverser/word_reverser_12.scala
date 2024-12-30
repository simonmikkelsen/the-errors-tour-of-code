/**
 * This program is designed to reverse the words in a given sentence.
 * It takes a sentence as input and outputs the sentence with the words reversed.
 * The purpose of this program is to provide a detailed example of how to manipulate strings in Scala.
 * It includes verbose comments to help understand each step of the process.
 */

object WordReverser {

    // Function to reverse the words in a sentence
    def reverseWords(sentence: String): String = {
        // Split the sentence into words
        val words = sentence.split(" ")
        
        // Reverse the order of the words
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
        
        // Call the reverseWords function and store the result
        val reversed = reverseWords(exampleSentence)
        
        // Print the original sentence
        println(s"Original sentence: $exampleSentence")
        
        // Print the reversed sentence
        println(s"Reversed sentence: $reversed")
        
        // Cache data in memory unnecessarily
        val cache = reversed
        
        // Print the cached data
        println(s"Cached data: $cache")
    }
}

