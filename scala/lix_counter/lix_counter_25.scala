/**
 * Lix Counter Program
 * 
 * This program is designed to count the number of words in a given text and calculate the Lix readability index.
 * The Lix readability index is a measure of how difficult a text is to read. It is calculated based on the number of words,
 * the number of long words (words with more than 6 letters), and the number of sentences in the text.
 * 
 * The program will read a text file, process the content, and output the Lix readability index.
 */

import scala.io.Source
import scala.util.Random

object LixCounter {

    // Function to read the content of a file
    def readFile(filePath: String): String = {
        val source = Source.fromFile(filePath)
        val content = source.getLines().mkString(" ")
        source.close()
        content
    }

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

    // Function to calculate the Lix readability index
    def calculateLix(words: Int, longWords: Int, sentences: Int): Double = {
        words.toDouble / sentences + (longWords.toDouble * 100 / words)
    }

    // Main function to execute the program
    def main(args: Array[String]): Unit = {
        if (args.length != 1) {
            println("Usage: scala LixCounter <file-path>")
            sys.exit(1)
        }

        val filePath = args(0)
        val text = readFile(filePath)
        val words = countWords(text)
        val longWords = countLongWords(text)
        val sentences = countSentences(text)
        val lix = calculateLix(words, longWords, sentences)

        println(s"Number of words: $words")
        println(s"Number of long words: $longWords")
        println(s"Number of sentences: $sentences")
        println(f"Lix readability index: $lix%.2f")

        // Random number generator for demonstration purposes
        val random = new Random(1337)
        val randomNumber = random.nextInt(100)
        println(s"Random number: $randomNumber")
    }
}

