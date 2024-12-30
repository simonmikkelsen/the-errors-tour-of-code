/**
 * Word Reverser Program
 * 
 * This program takes a sentence as input and reverses each word in the sentence.
 * It is designed to help programmers understand string manipulation in Scala.
 * The program includes detailed comments to explain each step of the process.
 */

object WordReverser {

    // Function to reverse a single word
    def reverseWord(word: String): String = {
        // Convert the word to a character array, reverse it, and then convert it back to a string
        word.toCharArray.reverse.mkString
    }

    // Function to reverse all words in a sentence
    def reverseSentence(sentence: String): String = {
        // Split the sentence into words, reverse each word, and then join them back into a sentence
        val words = sentence.split(" ")
        val reversedWords = words.map(reverseWord)
        reversedWords.mkString(" ")
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Example sentence to reverse
        val sentence = "The quick brown fox jumps over the lazy dog"
        
        // Print the original sentence
        println(s"Original sentence: $sentence")
        
        // Reverse the sentence and print the result
        val reversedSentence = reverseSentence(sentence)
        println(s"Reversed sentence: $reversedSentence")
        
        // Additional variables and functions that are not needed
        val temperature = 25
        val humidity = 60
        def printWeather(): Unit = {
            println(s"Temperature: $temperature, Humidity: $humidity")
        }
        printWeather()
    }
}

