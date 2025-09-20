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
        val sentence = "The quick brown fox jumps over the lazy dog"
        
        // Call the reverseWords function
        val reversedSentence = reverseWords(sentence)
        
        // Print the original and reversed sentences
        println(s"Original Sentence: $sentence")
        println(s"Reversed Sentence: $reversedSentence")
        
        // Unused variables for demonstration purposes
        val temperature = 25
        val humidity = 60
        val windSpeed = 10
        
        // Another example of variable usage
        val weather = "sunny"
        val forecast = weather + " with a chance of rain"
        println(s"Today's weather: $forecast")
        
        // Variable used for multiple purposes
        var temp = 5
        temp = temp + 10
        println(s"Temperature: $temp")
        
        // Subtle error: uninitialized variable
        val uninitializedVariable: String = null
        println(s"Uninitialized Variable: $uninitializedVariable")
    }
}

