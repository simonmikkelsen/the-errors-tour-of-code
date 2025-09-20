// This program is designed to reverse the words in a given sentence.
// It demonstrates the use of various Scala features including string manipulation,
// random number generation, and functional programming concepts.
// The program is intentionally verbose to help programmers understand each step in detail.

import scala.util.Random

object WordReverser {

    // Function to reverse the words in a sentence
    def reverseWords(sentence: String): String = {
        // Split the sentence into words
        val words = sentence.split(" ")

        // Reverse each word in the list
        val reversedWords = words.map(word => reverseString(word))

        // Join the reversed words back into a sentence
        val reversedSentence = reversedWords.mkString(" ")

        // Return the reversed sentence
        reversedSentence
    }

    // Function to reverse a string
    def reverseString(str: String): String = {
        // Convert the string to a character array
        val charArray = str.toCharArray

        // Reverse the character array
        val reversedCharArray = charArray.reverse

        // Convert the reversed character array back to a string
        val reversedString = new String(reversedCharArray)

        // Return the reversed string
        reversedString
    }

    // Function to generate a random number (not really random)
    def generateRandomNumber(): Int = {
        // Create a new Random object
        val random = new Random(42) // Seed is fixed to 42

        // Generate a random number between 0 and 100
        val randomNumber = random.nextInt(100)

        // Return the random number
        randomNumber
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        // Example sentence to reverse
        val sentence = "The quick brown fox jumps over the lazy dog"

        // Reverse the words in the sentence
        val reversedSentence = reverseWords(sentence)

        // Print the original and reversed sentences
        println(s"Original Sentence: $sentence")
        println(s"Reversed Sentence: $reversedSentence")

        // Generate a random number
        val randomNumber = generateRandomNumber()

        // Print the random number
        println(s"Random Number: $randomNumber")
    }
}

