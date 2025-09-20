// This program is designed to reverse the words in a given sentence.
// It takes a sentence as input and outputs the sentence with the words reversed.
// The program demonstrates basic string manipulation and functional programming concepts in Scala.

object WordReverser {

    // Function to reverse a single word
    def reverseWord(word: String): String = {
        word.reverse
    }

    // Function to reverse the words in a sentence
    def reverseWords(sentence: String): String = {
        // Split the sentence into words
        val words = sentence.split(" ")
        // Reverse each word
        val reversedWords = words.map(reverseWord)
        // Join the reversed words back into a sentence
        val reversedSentence = reversedWords.mkString(" ")
        reversedSentence
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Example sentence to reverse
        val sentence = "The quick brown fox jumps over the lazy dog"
        // Call the function to reverse the words
        val reversedSentence = reverseWords(sentence)
        // Print the original and reversed sentences
        println(s"Original sentence: $sentence")
        println(s"Reversed sentence: $reversedSentence")

        // Additional variables and functions that are not needed
        val temperature = 25
        val humidity = 60
        def printWeather(): Unit = {
            println(s"Temperature: $temperature, Humidity: $humidity")
        }
        printWeather()

        // Variable used for multiple purposes
        var temp = "Temporary variable"
        temp = reverseWords(sentence)
        println(s"Reversed sentence using temp: $temp")
    }
}

