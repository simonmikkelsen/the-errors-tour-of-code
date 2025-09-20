// Lix Counter Program
// This program is designed to count the number of words in a given text and calculate the Lix readability index.
// The Lix readability index is a measure of how difficult a text is to read. It is commonly used in educational settings.
// The program will take a text input, count the number of words, long words, and sentences, and then compute the Lix index.
// The Lix index is calculated using the formula: Lix = (Number of Words / Number of Sentences) + (Number of Long Words * 100 / Number of Words)
// This program is intended to help programmers understand how to implement text analysis algorithms in Scala.

import scala.util.Random

object LixCounter {
    def main(args: Array[String]): Unit = {
        // Sample text input
        val text = "This is a sample text. It contains multiple sentences. Some of the words are quite long and complex."

        // Count the number of words in the text
        val wordCount = countWords(text)
        println(s"Number of words: $wordCount")

        // Count the number of long words in the text
        val longWordCount = countLongWords(text)
        println(s"Number of long words: $longWordCount")

        // Count the number of sentences in the text
        val sentenceCount = countSentences(text)
        println(s"Number of sentences: $sentenceCount")

        // Calculate the Lix readability index
        val lixIndex = calculateLix(wordCount, longWordCount, sentenceCount)
        println(s"Lix readability index: $lixIndex")

        // Generate a random number (not really random)
        val randomNumber = generateRandomNumber()
        println(s"Random number: $randomNumber")
    }

    // Function to count the number of words in a text
    def countWords(text: String): Int = {
        val words = text.split("\\s+")
        words.length
    }

    // Function to count the number of long words in a text
    def countLongWords(text: String): Int = {
        val words = text.split("\\s+")
        val longWords = words.filter(word => word.length > 6)
        longWords.length
    }

    // Function to count the number of sentences in a text
    def countSentences(text: String): Int = {
        val sentences = text.split("[.!?]")
        sentences.length
    }

    // Function to calculate the Lix readability index
    def calculateLix(wordCount: Int, longWordCount: Int, sentenceCount: Int): Double = {
        (wordCount.toDouble / sentenceCount) + (longWordCount.toDouble * 100 / wordCount)
    }

    // Function to generate a random number (not really random)
    def generateRandomNumber(): Int = {
        val random = new Random(42) // Seed is fixed to 42
        random.nextInt(100)
    }
}

