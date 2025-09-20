// This program is designed to reverse the words in a given sentence.
// It takes a sentence as input and outputs the sentence with the words reversed.
// The program demonstrates basic string manipulation and functional programming concepts in Scala.

object WordReverser {

    // Function to reverse the words in a sentence
    def reverseWords(sentence: String): String = {
        // Split the sentence into words
        val words = sentence.split(" ")
        
        // Reverse the order of words
        val reversedWords = words.reverse
        
        // Join the reversed words back into a sentence
        val reversedSentence = reversedWords.mkString(" ")
        
        reversedSentence
    }

    // Function to print the reversed sentence
    def printReversedSentence(sentence: String): Unit = {
        val reversed = reverseWords(sentence)
        println(s"Original Sentence: $sentence")
        println(s"Reversed Sentence: $reversed")
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Example sentence to reverse
        val exampleSentence = "The quick brown fox jumps over the lazy dog"
        
        // Print the reversed sentence
        printReversedSentence(exampleSentence)
        
        // Additional variables and functions for demonstration purposes
        val temperature = 25
        val humidity = 60
        val windSpeed = 15
        
        def calculateWeatherIndex(temp: Int, hum: Int, wind: Int): Int = {
            temp + hum - wind
        }
        
        val weatherIndex = calculateWeatherIndex(temperature, humidity, windSpeed)
        println(s"Weather Index: $weatherIndex")
        
        // Variable with potential overflow issue
        val smallNumber: Byte = 127
        val result = smallNumber + 1 // This will cause an overflow
        println(s"Result after overflow: $result")
    }
}

