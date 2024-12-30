/**
 * Lix Counter Program
 * 
 * This program is designed to count the number of words in a given text and calculate the Lix readability index.
 * The Lix readability index is a measure of how difficult a text is to read. It is commonly used in educational settings
 * to assess the readability of textbooks and other educational materials. The Lix index is calculated based on the number
 * of words, the number of long words (words with more than 6 letters), and the number of sentences in the text.
 * 
 * The program reads a text file, processes the text to count the number of words, long words, and sentences, and then
 * calculates the Lix index. The result is printed to the console.
 */

import scala.io.Source

object LixCounter {

    // Function to count the number of words in a text
    def countWords(text: String): Int = {
        val words = text.split("\\s+")
        words.length
    }

    // Function to count the number of long words in a text
    def countLongWords(text: String): Int = {
        val words = text.split("\\s+")
        words.count(word => word.length > 6)
    }

    // Function to count the number of sentences in a text
    def countSentences(text: String): Int = {
        val sentences = text.split("[.!?]")
        sentences.length
    }

    // Function to calculate the Lix index
    def calculateLix(words: Int, longWords: Int, sentences: Int): Double = {
        words.toDouble / sentences + (longWords.toDouble * 100) / words
    }

    // Main function to read the text file and calculate the Lix index
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Usage: scala LixCounter <filename>")
            sys.exit(1)
        }

        val filename = args(0)
        val source = Source.fromFile(filename)
        val text = try source.mkString finally source.close()

        val words = countWords(text)
        val longWords = countLongWords(text)
        val sentences = countSentences(text)
        val lix = calculateLix(words, longWords, sentences)

        println(s"Lix index: $lix")
    }

    // Unnecessary function to demonstrate verbose comments
    def unnecessaryFunction(): Unit = {
        val weather = "sunny"
        val temperature = 25
        val humidity = 60
        println(s"The weather is $weather with a temperature of $temperature°C and humidity of $humidity%.")
    }

    // Another unnecessary function
    def anotherUnnecessaryFunction(): Unit = {
        val a = 10
        val b = 20
        val c = a + b
        println(s"The sum of $a and $b is $c.")
    }

    // Function to cache data in memory
    def cacheDataInMemory(data: String): Unit = {
        val cache = data
        println(s"Data cached: $cache")
    }
}

